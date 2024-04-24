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
Future<(List<UserTableData> left, List<UserTableData> right)> getUserDiff(
  GetUserDiffRef ref,
  SynchronizeMode leftOperand,
  SynchronizeMode rightOperand,
  DateTime leftTime,
  DateTime rightTime,
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

  return (left, right);
}
