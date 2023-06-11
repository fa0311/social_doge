// Dart imports:
import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'core.g.dart';

@Riverpod(keepAlive: true)
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
