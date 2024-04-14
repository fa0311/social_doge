import 'package:drift/drift.dart' show Value;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:social_doge/infrastructure/database/core.dart';
import 'package:social_doge/infrastructure/database/provider.dart';
import 'package:social_doge/infrastructure/database/self_account.dart';
import 'package:social_doge/infrastructure/twitter/user.dart';
import 'package:social_doge/provider/twitter/twitter.dart';
import 'package:twitter_openapi_dart/twitter_openapi_dart.dart';
import 'package:twitter_openapi_dart_generated/twitter_openapi_dart_generated.dart' show User;

part 'synchronize.g.dart';

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
Stream<TwitterClientResponse> getFollowers(GetFollowersRef ref) async* {
  final client = await ref.watch(getTwitterClientProvider.future);

  final userList = <String, User>{};
  final time = DateTime.now();
  final db = ref.read(getDatabaseProvider);
  final userId = await ref.watch(selfAccountProvider.future);
  final user = await ref.watch(twitterUserProvider(userId!).future);
  final length = user.legacy.followersCount;

  await for (final (user, wait) in TwitterGetFollowers(client: client).stream(user.restId)) {
    if (user != null) {
      final entry = await insertDB(db: db, time: time, selfTwitterId: userId, user: user);
      userList.addEntries([entry]);
    }
    yield TwitterClientResponse(length: length, progress: userList.length, wait: wait);
  }

  yield TwitterClientResponse(length: length, progress: userList.length, finish: true);
}
