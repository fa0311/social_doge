// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:social_doge/component/label.dart';
import 'package:social_doge/component/loading.dart';
import 'package:social_doge/database/core.dart';
import 'package:social_doge/database/user.dart';
import 'package:social_doge/view/top/home.dart';
import 'package:social_doge/view/top/page/main.dart';
import 'package:twitter_openapi_dart/twitter_openapi_dart.dart';

// Project imports:
import 'package:social_doge/auth/inappwebview.dart';

part 'synchronized.g.dart';

class TwitterClientResponse {
  final int length;
  final int progress;
  final bool finish;
  final int? wait;

  TwitterClientResponse({
    required this.length,
    required this.progress,
    this.finish = false,
    this.wait,
  });
}

int secondsSinceEpoch() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}

@riverpod
Stream<TwitterClientResponse> twitterClient(TwitterClientRef ref) async* {
  final api = TwitterOpenapiDart()..addBeforeInterceptor(FlutterInappwebviewDio());
  final client = await api.getClient(initCookie: false);

  final userList = <String, UserDB>{};
  final now = DateTime.now();
  final time = now.millisecondsSinceEpoch;
  final db = await ref.read(getDatabaseProvider.future);

  final user = await client.getUserApi().getUserByScreenName(screenName: "faa0311");
  final length = user.data.legacy.followersCount;
  yield TwitterClientResponse(length: length, progress: userList.length);

  final response = await client.getUserListApi().getFollowers(userId: user.data.restId, count: 200);
  final userJoin = await Future.wait(response.data.map((e) => insertDB(db, time, "user_followers", e.user)));
  userList.addEntries(userJoin.map((e) => MapEntry<String, UserDB>(e.twitterId, e)));
  while (response.header.rateLimitRemaining < 5 && response.header.rateLimitReset - secondsSinceEpoch() > 0) {
    yield TwitterClientResponse(length: length, progress: userList.length, wait: response.header.rateLimitReset - secondsSinceEpoch());
    await Future.delayed(const Duration(seconds: 1));
  }
  yield TwitterClientResponse(length: length, progress: userList.length);

  String? topCursor = response.cursor.top?.value;
  String? bottomCursor = response.cursor.bottom?.value;

  while (topCursor != null) {
    final userListLen = userList.length;
    final response = await client.getUserListApi().getFollowers(userId: user.data.restId, cursor: topCursor, count: 200);
    final userJoin = await Future.wait(response.data.map((e) => insertDB(db, time, "user_followers", e.user)));
    userList.addEntries(userJoin.map((e) => MapEntry<String, UserDB>(e.twitterId, e)));
    topCursor = userListLen < userList.length ? response.cursor.top?.value : null;
    while (response.header.rateLimitRemaining < 5 && response.header.rateLimitReset - secondsSinceEpoch() > 0) {
      yield TwitterClientResponse(length: length, progress: userList.length, wait: response.header.rateLimitReset - secondsSinceEpoch());
      await Future.delayed(const Duration(seconds: 1));
    }
    yield TwitterClientResponse(length: length, progress: userList.length);
  }

  while (bottomCursor != null) {
    final userListLen = userList.length;
    final response = await client.getUserListApi().getFollowers(userId: user.data.restId, cursor: bottomCursor, count: 200);
    final userJoin = await Future.wait(response.data.map((e) => insertDB(db, time, "user_followers", e.user)));
    userList.addEntries(userJoin.map((e) => MapEntry<String, UserDB>(e.twitterId, e)));
    bottomCursor = userListLen < userList.length ? response.cursor.bottom?.value : null;
    while (response.header.rateLimitRemaining < 5 && response.header.rateLimitReset - secondsSinceEpoch() > 0) {
      yield TwitterClientResponse(length: length, progress: userList.length, wait: response.header.rateLimitReset - secondsSinceEpoch());
      await Future.delayed(const Duration(seconds: 1));
    }
    yield TwitterClientResponse(length: length, progress: userList.length);
  }
  await Future.wait([
    ref.refresh(getFollowersCountProvider(60 * 60 * 24 * 30 * 1000).future),
    ref.refresh(getFollowersCountProvider(60 * 60 * 24 * 90 * 1000).future),
    ref.refresh(getFollowersCountProvider(60 * 60 * 24 * 365 * 1000).future),
    ref.refresh(getFollowersCountProvider(null).future),
  ]);
  yield TwitterClientResponse(
    length: length,
    progress: userList.length,
    finish: true,
  );
}

class Synchronize extends ConsumerWidget {
  const Synchronize({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final client = ref.watch(twitterClientProvider);

    return Scaffold(
      drawerEdgeDragWidth: MediaQuery.of(context).padding.left + 40,
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.synchronize)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: client.when(
            loading: () => const Loading(),
            data: (messages) {
              return Column(
                children: [
                  Text("${messages.progress}/${messages.length}"),
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
                  if (messages.finish)
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                          ..pop()
                          ..push(MaterialPageRoute(builder: (context) => const SocialDogeHome()));
                      },
                      child: const Text("閉じる"),
                    )
                  else
                    const ElevatedButton(
                      onPressed: null,
                      child: Text("閉じる"),
                    )
                ],
              );
            },
            error: (error, stackTrace) => Text(error.toString()),
          ),
        ),
      ),
    );
  }
}
