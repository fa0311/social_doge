// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:social_doge/component/label.dart';
import 'package:social_doge/component/loading.dart';
import 'package:social_doge/view/top/home.dart';
import 'package:social_doge/view/top/page/main.dart';
import 'package:sqflite/sqflite.dart';
import 'package:twitter_openapi_dart/twitter_openapi_dart.dart';
import 'package:twitter_openapi_dart_generated/twitter_openapi_dart_generated.dart';

// Project imports:
import 'package:social_doge/auth/inappwebview.dart';

part 'synchronized.g.dart';

@riverpod
Future<Database> getDatabase(GetDatabaseRef ref) async {
  // await deleteDatabase(join(await getDatabasesPath(), 'twitter.db'));

  final db = await openDatabase(
    join(await getDatabasesPath(), 'twitter.db'),
    onCreate: (database, version) async {
      await database.execute(
        "CREATE TABLE user(id INTEGER PRIMARY KEY AUTOINCREMENT, twitter_id TEXT UNIQUE, screen_name TEXT, name TEXT, description TEXT, profile_banner_url TEXT, profile_image_url TEXT)",
      );
      /*
      await database.execute(
        "CREATE TABLE history(id INTEGER PRIMARY KEY AUTOINCREMENT, time INTEGER)",
      );
      */
      await database.execute(
        "CREATE TABLE user_followers(id INTEGER PRIMARY KEY AUTOINCREMENT, twitter_id TEXT, self_twitter_id TEXT, time INTEGER)",
      );
      /*
      await database.execute(
        "CREATE TABLE user_following(id INTEGER PRIMARY KEY AUTOINCREMENT, twitter_id TEXT, self_twitter_id TEXT, time INTEGER)",
      );
      */
      // await testInsert(database);
    },
    version: 1,
  );
  return db;
}

testInsert(Database db) async {
  final now = DateTime.now();
  final timeBase = now.millisecondsSinceEpoch;
  final user = [];
  for (int ii = 0; ii < 50; ii++) {
    user.add(await testGenUserDB(db));
  }
  for (int i = 0; i < 100; i++) {
    const cycle = 60 * 60 * 24 * 1000 * 2;
    final time = timeBase - (cycle * (100 - i)) - Random().nextInt(cycle);
    for (int ii = 0; ii < Random().nextInt(7); ii++) {
      user.add(await testGenUserDB(db));
    }
    for (int ii = 0; ii < Random().nextInt(5); ii++) {
      user.removeAt(Random().nextInt(user.length));
    }
    for (var u in user) {
      await testInsertDB(db, u, time);
    }
  }
}

Future<UserDB> testGenUserDB(Database db) async {
  const String charset = '0123456789ABCDEF';
  final random = Random();
  String id = List.generate(10, (_) => charset[random.nextInt(charset.length)]).join();
  final userDB = UserDB(
    twitterId: id,
    screenName: "screenName",
    name: "name",
    description: "description",
    profileImageUrl: "https://pbs.twimg.com/profile_images/1449745429801811978/lHINmMuy_400x400.jpg",
    profileBannerUrl: "https://pbs.twimg.com/profile_banners/900282258736545792/1645014441/1500x500",
  );
  await db.insert("user", userDB.toMap());
  return userDB;
}

Future testInsertDB(Database db, UserDB user, int time) async {
  final userStatusDB = UserStatusDB(
    twitterId: user.twitterId,
    selfTwitterId: '114514',
    time: time,
  );

  await db.insert("user_followers", userStatusDB.toMap());
}

class UserDB {
  final String twitterId;
  final String screenName;
  final String name;
  final String description;
  final String? profileBannerUrl;
  final String profileImageUrl;

  const UserDB({
    required this.twitterId,
    required this.screenName,
    required this.name,
    required this.description,
    required this.profileImageUrl,
    this.profileBannerUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'twitter_id': twitterId,
      'screen_name': screenName,
      'name': name,
      'description': description,
      'profile_banner_url': profileBannerUrl,
      'profile_image_url': profileImageUrl,
    };
  }
}

class UserStatusDB {
  final String twitterId;
  final String selfTwitterId;
  final int time;

  const UserStatusDB({
    required this.twitterId,
    required this.selfTwitterId,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'twitter_id': twitterId,
      'self_twitter_id': selfTwitterId,
      'time': time,
    };
  }
}

Future<UserDB> insertDB(Database db, int time, String table, User user) async {
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
    selfTwitterId: '114514',
    time: time,
  );

  final userStatusFetch = await db.query('user_followers', where: 'twitter_id = ? AND time = ?', whereArgs: [user.restId, time]);

  if (userStatusFetch.isEmpty) {
    await db.insert("user_followers", userStatusDB.toMap());

    final userFetch = await db.query('user', where: 'twitter_id = ?', whereArgs: [user.restId]);
    if (userFetch.isEmpty) {
      await db.insert("user", userDB.toMap());
    } else {
      await db.update("user", userDB.toMap(), where: 'twitter_id = ?', whereArgs: [user.restId]);
    }
  }
  return userDB;
}

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
