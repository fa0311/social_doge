import 'package:sqflite/sqflite.dart';
import 'package:twitter_openapi_dart_generated/twitter_openapi_dart_generated.dart';

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
