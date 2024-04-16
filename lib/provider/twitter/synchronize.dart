import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:social_doge/infrastructure/database/core.dart';
import 'package:social_doge/infrastructure/database/provider.dart';
import 'package:social_doge/infrastructure/twitter/user.dart';
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
    friendsCount: user.legacy.friendsCount,
    createdAt: dateFormatFromTwitterFormat(user.legacy.createdAt),
    lastUpdated: DateTime.now(),
  );
}

enum SynchronizeMode { follow, follower }

@riverpod
Stream<TwitterClientResponse> runSynchronize(RunSynchronizeRef ref, SynchronizeMode mode) async* {
  final client = await ref.watch(getTwitterClientProvider.future);

  final time = DateTime.now();
  final db = ref.read(getDatabaseProvider);
  final userId = await ref.watch(selfAccountProvider.future);
  final selfUser = await ref.watch(twitterUserProvider(userId!).future);
  final selfTwitterId = selfUser.restId;

  Future<void> insertFollower(User user, String twitterId) async {
    final userFollower = UserFollowerTableCompanion.insert(
      twitterId: twitterId,
      selfTwitterId: selfTwitterId,
      time: time,
    );
    await db.upsertUser(toUserTable(user: user));
    await db.addFollower(userFollower);
  }

  Future<void> insertFollow(User user, String twitterId) async {
    final userFollow = UserFollowTableCompanion.insert(
      twitterId: twitterId,
      selfTwitterId: selfTwitterId,
      time: time,
    );
    await db.upsertUser(toUserTable(user: user));
    await db.addFollow(userFollow);
  }

  final (length, stream, insert, delete) = switch (mode) {
    SynchronizeMode.follow => (
        selfUser.legacy.friendsCount,
        TwitterGetFollow(client: client),
        insertFollow,
        db.deleteFollow,
      ),
    SynchronizeMode.follower => (
        selfUser.legacy.followersCount,
        TwitterGetFollower(client: client),
        insertFollower,
        db.deleteFollower,
      ),
  };

  var progress = 0;
  var finish = false;

  ref.onDispose(() async {
    if (!finish) {
      await delete(userId: selfTwitterId, time: time);
    }
  });

  await for (final (user, wait) in stream.stream(selfTwitterId)) {
    if (user != null) {
      await insert(user, user.restId);
      progress++;
    }
    yield TwitterClientResponse(length: length, progress: progress, wait: wait, finish: finish);
  }

  finish = true;
  yield TwitterClientResponse(length: length, progress: progress, wait: null, finish: finish);
}
