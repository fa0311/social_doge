import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:social_doge/infrastructure/database/core.dart';
import 'package:social_doge/infrastructure/database/data.dart';
import 'package:social_doge/provider/twitter/account.dart';

part 'db.g.dart';

enum OperatorType {
  intersection,
  union,
  difference,
  symmetricDifference;
}

enum SortType {
  asc,
  desc,
}

enum SortBy {
  id,
  name,
  screenName,
  followerCount,
  followingCount,
  createdAt,
  ffRate,
}

@Riverpod(keepAlive: true)
SocialDogeDatabase getDatabase(GetDatabaseRef ref) {
  return SocialDogeDatabase();
}

@riverpod
Future<List<SyncStatusData>> getUserSyncStatus(GetUserSyncStatusRef ref, SynchronizeMode mode) async {
  final user = await ref.watch(getSelfAccountProvider.future);
  final db = ref.read(getDatabaseProvider);
  return db.getUserSyncStatus(userId: user.restId, mode: mode);
}

@riverpod
Future<UserTableData> getUser(GetUserRef ref, String id) async {
  final db = ref.read(getDatabaseProvider);
  final response = await db.getUser(twitterId: id);
  return response;
}

@riverpod
Future<List<UserTableData>> getUserStatus(GetUserStatusRef ref, DateTime time, SynchronizeMode mode) async {
  final user = await ref.watch(getSelfAccountProvider.future);
  final db = ref.read(getDatabaseProvider);
  return db.getUserStatus(userId: user.restId, time: time, mode: mode);
}

@riverpod
Future<List<UserTableData>> getUserDiff(
  GetUserDiffRef ref,
  SynchronizeMode leftOperand,
  SynchronizeMode rightOperand,
  DateTime leftTime,
  DateTime rightTime,
  OperatorType operator,
  SortType sortType,
  SortBy sortBy,
) async {
  final db = ref.read(getDatabaseProvider);
  final user = await ref.watch(getSelfAccountProvider.future);
  final left = await db.getUserStatus(
    userId: user.restId,
    mode: leftOperand,
    time: leftTime,
  );
  final right = await db.getUserStatus(
    userId: user.restId,
    mode: rightOperand,
    time: rightTime,
  );
  final leftSet = left.toSet();
  final rightSet = right.toSet();

  final data = switch (operator) {
    OperatorType.intersection => leftSet.intersection(rightSet),
    OperatorType.union => leftSet.union(rightSet),
    OperatorType.difference => leftSet.difference(rightSet),
    OperatorType.symmetricDifference => leftSet.union(rightSet).difference(leftSet.intersection(rightSet)),
  };

  final s = switch (sortBy) {
    SortBy.id => (UserTableData a, UserTableData b) => a.twitterId.compareTo(b.twitterId),
    SortBy.name => (UserTableData a, UserTableData b) => a.name.compareTo(b.name),
    SortBy.screenName => (UserTableData a, UserTableData b) => a.screenName.compareTo(b.screenName),
    SortBy.followerCount => (UserTableData a, UserTableData b) => a.followerCount.compareTo(b.followerCount),
    SortBy.followingCount => (UserTableData a, UserTableData b) => a.followingCount.compareTo(b.followingCount),
    SortBy.createdAt => (UserTableData a, UserTableData b) => a.createdAt.compareTo(b.createdAt),
    SortBy.ffRate => (UserTableData a, UserTableData b) => (a.followerCount / a.followingCount).compareTo(b.followerCount / b.followingCount),
  };

  final sort = switch (sortType) {
    SortType.asc => (UserTableData a, UserTableData b) => s(b, a),
    SortType.desc => (UserTableData a, UserTableData b) => s(b, a),
  };

  final sorted = data.sorted(sort);
  return sorted;
}

@Riverpod(keepAlive: true)
class UserState extends _$UserState {
  @override
  UserTableData? build(String userId) => null;

  // ignore: use_setters_to_change_properties
  void change(UserTableData newState) {
    state = newState;
  }
}

@riverpod
Future<UserTableData> getUserState(GetUserStateRef ref, String userId) async {
  final userOrNull = ref.watch(userStateProvider(userId));
  if (userOrNull == null) {
    final user = await ref.read(getUserProvider(userId).future);
    ref.read(userStateProvider(userId).notifier).change(user);
    return user;
  } else {
    return userOrNull;
  }
}
