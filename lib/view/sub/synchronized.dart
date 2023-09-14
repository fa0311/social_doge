import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:social_doge/component/confirm.dart';
import 'package:social_doge/component/label.dart';
import 'package:social_doge/component/loading.dart';
import 'package:social_doge/database/core.dart';
import 'package:social_doge/database/provider.dart';
import 'package:social_doge/database/self_account.dart';
import 'package:social_doge/interface/twitter.dart';
import 'package:social_doge/view/top/home.dart';
import 'package:social_doge/view/top/page/main.dart';
import 'package:twitter_openapi_dart/twitter_openapi_dart.dart';
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

Future<MapEntry<String, User>> insertDB({
  required SocialDogeDatabase db,
  required DateTime time,
  required String selfTwitterId,
  required User user,
}) async {
  final insertUser = UserTableCompanion.insert(
    twitterId: user.restId,
    screenName: user.legacy.screenName,
    name: user.legacy.name,
    description: user.legacy.description,
    profileBannerUrl: Value(user.legacy.profileBannerUrl),
    profileImageUrl: user.legacy.profileImageUrlHttps,
    followersCount: user.legacy.followersCount,
    friendsCount: user.legacy.friendsCount,
    createdAt: dateFormatFromTwitterFormat(user.legacy.createdAt),
    lastUpdated: DateTime.now(),
  );
  final userFollowers = UserFollowersTableCompanion.insert(
    twitterId: user.restId,
    selfTwitterId: selfTwitterId,
    time: time,
  );
  await db.upsertUser(insertUser);
  await db.addFollowers(userFollowers);

  return MapEntry<String, User>(user.restId, user);
}

@riverpod
Stream<TwitterClientResponse> twitterClient(TwitterClientRef ref) async* {
  final client = await ref.watch(getTwitterClientProvider.future);

  final userList = <String, User>{};
  final time = DateTime.now();
  final db = ref.read(getDatabaseProvider);
  final userId = ref.watch(selfAccountProvider);
  final user = await ref.watch(twitterUserProvider(userId!).future);
  final length = user.legacy.followersCount;

  yield TwitterClientResponse(length: length, progress: userList.length);

  final response = await client.getUserListApi().getFollowers(userId: user.restId, count: 200);
  userList.addEntries(await Future.wait(response.data.map((e) => insertDB(db: db, time: time, selfTwitterId: userId, user: e.user))));

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
    userList.addEntries(await Future.wait(response.data.map((e) => insertDB(db: db, time: time, selfTwitterId: userId, user: e.user))));
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
    userList.addEntries(await Future.wait(response.data.map((e) => insertDB(db: db, time: time, selfTwitterId: userId, user: e.user))));
    bottomCursor = userListLen < userList.length ? response.cursor.bottom?.value : null;
    while (response.header.rateLimitRemaining < 5 && response.header.rateLimitReset - secondsSinceEpoch() > 0) {
      yield TwitterClientResponse(length: length, progress: userList.length, wait: response.header.rateLimitReset - secondsSinceEpoch());
      await Future<void>.delayed(const Duration(seconds: 1));
    }
    yield TwitterClientResponse(length: length, progress: userList.length);
  }
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
                    ),
                ],
              );
            },
            error: (error, stackTrace) => Column(
              children: [
                for (final e in [error.toString(), stackTrace.toString()]) Text(e),
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
            for (final e in [error.toString(), stackTrace.toString()]) Text(e),
          ],
        ),
        loading: () => SizedBox(height: MediaQuery.of(context).size.height, child: const Center(child: Loading())),
      ),
    );
  }
}
