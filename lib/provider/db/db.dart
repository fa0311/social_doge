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
Future<List<String>> getUserStatus(GetUserStatusRef ref, DateTime time, SynchronizeMode mode) async {
  final user = await ref.watch(getSelfAccountProvider.future);
  final db = ref.read(getDatabaseProvider);
  return db.getUserStatus(userId: user.restId, time: time, mode: mode);
}

@riverpod
Future<Set<String>> getUserDiff(
  GetUserDiffRef ref,
  SynchronizeMode leftOperand,
  SynchronizeMode rightOperand,
  DateTime leftTime,
  DateTime rightTime,
  OperatorType operator,
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

  return switch (operator) {
    OperatorType.intersection => leftSet.intersection(rightSet),
    OperatorType.union => leftSet.union(rightSet),
    OperatorType.difference => leftSet.difference(rightSet),
    OperatorType.symmetricDifference => leftSet.union(rightSet).difference(leftSet.intersection(rightSet)),
  };
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
