import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:social_doge/component/confirm.dart';
import 'package:social_doge/component/label.dart';
import 'package:social_doge/component/loading.dart';
import 'package:social_doge/database/core.dart';
import 'package:social_doge/database/self_account.dart';
import 'package:social_doge/interface/twitter.dart';
import 'package:social_doge/view/top/home.dart';
import 'package:social_doge/view/top/page/main.dart';
import 'package:sqflite/sqflite.dart';
import 'package:twitter_openapi_dart_generated/twitter_openapi_dart_generated.dart';
part 'synchronized.g.dart';

class TwitterClientResponse {
  TwitterClientResponse({
    required this.length,
    required this.progress,
    this.finish = false,
    this.wait,
  });
  final int length;
  final int progress;
  final bool finish;
  final int? wait;
}

int secondsSinceEpoch() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}

Future<UserDB> insertDB(Database db, int time, String table, User user, String selfTwitterId) async {
  final userDB = UserDB(
    twitterId: user.restId,
    screenName: user.legacy.screenName,
    name: user.legacy.name,
    description: user.legacy.description,
    profileBannerUrl: user.legacy.profileBannerUrl,
    profileImageUrl: user.legacy.profileImageUrlHttps,
  );

  final userStatusDB = UserStatusDB(
    twitterId: user.restId,
    selfTwitterId: selfTwitterId,
    time: time,
  );

  final userStatusFetch = await db.query('user_followers', where: 'twitter_id = ? AND time = ?', whereArgs: [user.restId, time]);

  if (userStatusFetch.isEmpty) {
    await db.insert('user_followers', userStatusDB.toMap());

    final userFetch = await db.query('user', where: 'twitter_id = ?', whereArgs: [user.restId]);
    if (userFetch.isEmpty) {
      await db.insert('user', userDB.toMap());
    } else {
      await db.update('user', userDB.toMap(), where: 'twitter_id = ?', whereArgs: [user.restId]);
    }
  }
  return userDB;
}

@riverpod
Stream<TwitterClientResponse> twitterClient(TwitterClientRef ref) async* {
  final client = await ref.watch(getTwitterClientProvider.future);

  final userList = <String, UserDB>{};
  final now = DateTime.now();
  final time = now.millisecondsSinceEpoch;
  final db = await ref.watch(getDatabaseProvider.future);
  final userId = ref.watch(selfAccountProvider);
  final user = await ref.watch(twitterUserProvider(userId!).future);
  final length = user.legacy.followersCount;

  yield TwitterClientResponse(length: length, progress: userList.length);

  final response = await client.getUserListApi().getFollowers(userId: user.restId, count: 200);
  final userJoin = await Future.wait(response.data.map((e) => insertDB(db, time, 'user_followers', e.user, userId)));
  userList.addEntries(userJoin.map((e) => MapEntry<String, UserDB>(e.twitterId, e)));
  while (response.header.rateLimitRemaining < 5 && response.header.rateLimitReset - secondsSinceEpoch() > 0) {
    yield TwitterClientResponse(length: length, progress: userList.length, wait: response.header.rateLimitReset - secondsSinceEpoch());
    await Future<void>.delayed(const Duration(seconds: 1));
  }
  yield TwitterClientResponse(length: length, progress: userList.length);

  var topCursor = response.cursor.top?.value;
  var bottomCursor = response.cursor.bottom?.value;

  while (topCursor != null) {
    final userListLen = userList.length;
    final response = await client.getUserListApi().getFollowers(userId: user.restId, cursor: topCursor, count: 200);
    final userJoin = await Future.wait(response.data.map((e) => insertDB(db, time, 'user_followers', e.user, userId)));
    userList.addEntries(userJoin.map((e) => MapEntry<String, UserDB>(e.twitterId, e)));
    topCursor = userListLen < userList.length ? response.cursor.top?.value : null;
    while (response.header.rateLimitRemaining < 5 && response.header.rateLimitReset - secondsSinceEpoch() > 0) {
      yield TwitterClientResponse(length: length, progress: userList.length, wait: response.header.rateLimitReset - secondsSinceEpoch());
      await Future<void>.delayed(const Duration(seconds: 1));
    }
    yield TwitterClientResponse(length: length, progress: userList.length);
  }

  while (bottomCursor != null) {
    final userListLen = userList.length;
    final response = await client.getUserListApi().getFollowers(userId: user.restId, cursor: bottomCursor, count: 200);
    final userJoin = await Future.wait(response.data.map((e) => insertDB(db, time, 'user_followers', e.user, userId)));
    userList.addEntries(userJoin.map((e) => MapEntry<String, UserDB>(e.twitterId, e)));
    bottomCursor = userListLen < userList.length ? response.cursor.bottom?.value : null;
    while (response.header.rateLimitRemaining < 5 && response.header.rateLimitReset - secondsSinceEpoch() > 0) {
      yield TwitterClientResponse(length: length, progress: userList.length, wait: response.header.rateLimitReset - secondsSinceEpoch());
      await Future<void>.delayed(const Duration(seconds: 1));
    }
    yield TwitterClientResponse(length: length, progress: userList.length);
  }
  await Future.wait([
    ref.refresh(getFollowersCountProvider(60 * 60 * 24 * 30 * 1000).future),
    ref.refresh(getFollowersCountProvider(60 * 60 * 24 * 90 * 1000).future),
    ref.refresh(getFollowersCountProvider(60 * 60 * 24 * 365 * 1000).future),
    ref.refresh(getFollowersCountProvider(null).future),
  ]);
  yield TwitterClientResponse(length: length, progress: userList.length, finish: true);
}

class Synchronize extends ConsumerWidget {
  const Synchronize({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final client = ref.watch(twitterClientProvider);
    // ref.watch(twitterClientCancelProvider);

    return Scaffold(
      drawerEdgeDragWidth: MediaQuery.of(context).padding.left + 40,
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.synchronize)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: client.when(
            data: (messages) {
              return Column(
                children: [
                  Text('${messages.progress}/${messages.length}'),
                  ClipRRect(
                    child: LinearProgressIndicator(
                      value: messages.progress / messages.length,
                    ),
                  ),
                  if (!messages.finish)
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: AlertLabel(child: Text(AppLocalizations.of(context)!.syncAlert)),
                    ),
                  if (messages.finish)
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: SuccessLabel(child: Text(AppLocalizations.of(context)!.syncSuccess)),
                    ),
                  Expanded(child: Container()),
                  if (messages.wait != null) ...[
                    Text(AppLocalizations.of(context)!.apiLimit),
                    Text(AppLocalizations.of(context)!.apiLimitDetails(messages.wait!)),
                  ],
                  if (!messages.finish)
                    ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
                      onPressed: () {
                        showDialog<void>(
                          context: context,
                          builder: (BuildContext context) => ConfirmDialog(
                            pop: false,
                            content: Text(AppLocalizations.of(context)!.syncCancelConfirm),
                            onPressed: () async {
                              await Navigator.of(context)
                                  .pushAndRemoveUntil(MaterialPageRoute<void>(builder: (context) => const SynchronizeRemove()), (_) => false);
                            },
                          ),
                        );
                      },
                      child: Text(AppLocalizations.of(context)!.cancel),
                    ),
                  if (messages.finish)
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute<void>(builder: (context) => const SocialDogeHome()), (_) => false);
                      },
                      child: Text(AppLocalizations.of(context)!.close),
                    )
                ],
              );
            },
            error: (error, stackTrace) => Column(
              children: [
                for (final e in [error.toString(), stackTrace.toString()]) Text(e)
              ],
            ),
            loading: () => const Loading(),
          ),
        ),
      ),
    );
  }
}

class SynchronizeRemove extends ConsumerWidget {
  const SynchronizeRemove({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final remover = ref.watch(removeLastSynchronizedProvider);

    return Scaffold(
      body: remover.when(
        data: (_) {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            await Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute<void>(builder: (context) => const SocialDogeHome()), (_) => false);
          });
          return SizedBox(height: MediaQuery.of(context).size.height, child: const Center(child: Loading()));
        },
        error: (error, stackTrace) => Column(
          children: [
            for (final e in [error.toString(), stackTrace.toString()]) Text(e)
          ],
        ),
        loading: () => SizedBox(height: MediaQuery.of(context).size.height, child: const Center(child: Loading())),
      ),
    );
  }
}
