// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:social_doge/database/core.dart';

part 'user.g.dart';

@Riverpod(keepAlive: true)
Future<UserDB> getUser(GetUserRef ref, String id) async {
  final db = await ref.read(getDatabaseProvider.future);
  final user = await db.query("user", where: "twitter_id = ?", whereArgs: [id]);
  return UserDB.fromQuery(user.first);
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

  UserDB.fromQuery(Map<String, Object?> data)
      : twitterId = data["twitter_id"] as String,
        screenName = data["screen_name"] as String,
        name = data["name"] as String,
        description = data["description"] as String,
        profileImageUrl = data["profile_image_url"] as String,
        profileBannerUrl = data["profile_banner_url"] as String?;

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

  UserStatusDB.fromQuery(Map<String, Object?> data)
      : twitterId = data["twitter_id"] as String,
        selfTwitterId = data["self_twitter_id"] as String,
        time = data["time"] as int;

  Map<String, dynamic> toMap() {
    return {
      'twitter_id': twitterId,
      'self_twitter_id': selfTwitterId,
      'time': time,
    };
  }
}

class SelfTwitter {
  final String selfTwitterId;
  final int loginTime;

  const SelfTwitter({
    required this.selfTwitterId,
    required this.loginTime,
  });

  SelfTwitter.fromQuery(Map<String, Object?> data)
      : selfTwitterId = data["self_twitter_id"] as String,
        loginTime = data["login_time"] as int;

  Map<String, dynamic> toMap() {
    return {
      'self_twitter_id': selfTwitterId,
      'login_time': loginTime,
    };
  }
}
