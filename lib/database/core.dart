// Dart imports:
import 'dart:math';
import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:social_doge/database/user.dart';
import 'package:sqflite/sqflite.dart';

part 'core.g.dart';

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
      await database.execute(
        "CREATE TABLE self_account(id INTEGER PRIMARY KEY AUTOINCREMENT, self_twitter_id TEXT, login_time INTEGER)",
      );
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
