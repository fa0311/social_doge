import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:social_doge/infrastructure/database/core.dart';
import 'package:social_doge/infrastructure/database/data.dart';
import 'package:social_doge/infrastructure/twitter/user.dart';
import 'package:social_doge/provider/db/db.dart';
import 'package:social_doge/provider/twitter/account.dart';
import 'package:social_doge/provider/twitter/twitter.dart';
import 'package:twitter_openapi_dart/twitter_openapi_dart.dart';
import 'package:twitter_openapi_dart_generated/twitter_openapi_dart_generated.dart';

part 'synchronize.g.dart';

class TwitterClientResponse {
  TwitterClientResponse({
    required this.length,
    required this.progress,
    required this.finish,
    required this.wait,
  });
  final int length;
  final int progress;
  final bool finish;
  final int? wait;
}

UserTableCompanion toUserTable({required User user}) {
  return UserTableCompanion.insert(
    twitterId: user.restId,
    screenName: user.legacy.screenName,
    name: user.legacy.name,
    description: user.legacy.description,
    profileBannerUrl: Value(user.legacy.profileBannerUrl),
    profileImageUrl: user.legacy.profileImageUrlHttps,
    followerCount: user.legacy.followersCount,
    followingCount: user.legacy.friendsCount,
    createdAt: dateFormatFromTwitterFormat(user.legacy.createdAt),
    lastUpdated: DateTime.now(),
  );
}

UserTableData toUserData({required User user}) {
  return UserTableData(
    twitterId: user.restId,
    screenName: user.legacy.screenName,
    name: user.legacy.name,
    description: user.legacy.description,
    profileBannerUrl: user.legacy.profileBannerUrl,
    profileImageUrl: user.legacy.profileImageUrlHttps,
    followerCount: user.legacy.followersCount,
    followingCount: user.legacy.friendsCount,
    createdAt: dateFormatFromTwitterFormat(user.legacy.createdAt),
    lastUpdated: DateTime.now(),
  );
}

@riverpod
Stream<TwitterClientResponse> runSynchronize(RunSynchronizeRef ref, SynchronizeMode mode) async* {
  final client = await ref.watch(getTwitterClientProvider.future);

  final time = DateTime.now();
  final db = ref.read(getDatabaseProvider);
  final selfUser = await ref.watch(getSelfAccountProvider.future);
  final selfTwitterId = selfUser.restId;

  Future<void> insertStatus(User user) async {
    final status = UserStatusData(
      twitterId: user.restId,
      selfTwitterId: selfTwitterId,
      time: time,
      key: 0,
    );
    await db.upsertUser(toUserTable(user: user));
    await db.addUserStatus(entry: status, mode: mode);
  }

  final (length, stream) = switch (mode) {
    SynchronizeMode.following => (selfUser.legacy.friendsCount, TwitterGetFollowing(client: client)),
    SynchronizeMode.follower => (selfUser.legacy.followersCount, TwitterGetFollower(client: client)),
  };

  var progress = 0;

  await for (final (user, wait) in stream.stream(selfTwitterId)) {
    if (user != null) {
      await insertStatus(user);
      progress++;
    }
    yield TwitterClientResponse(length: length, progress: progress, wait: wait, finish: false);
  }

  final sync = SyncStatusData(
    selfTwitterId: selfTwitterId,
    time: time,
    count: progress,
    key: 0,
  );
  await db.addUserSyncStatus(entry: sync, mode: mode);
  yield TwitterClientResponse(length: length, progress: progress, wait: null, finish: true);
}
