import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:social_doge/infrastructure/database/data.dart';
import 'package:social_doge/infrastructure/database/provider.dart';
import 'package:social_doge/provider/twitter/account.dart';

part 'db.g.dart';

@riverpod
Future<List<DateTime>> getFollowerTime(GetFollowerTimeRef ref) async {
  final userId = await ref.watch(selfAccountProvider.future);
  final db = ref.read(getDatabaseProvider);
  final response = await db.followerTime(userId: userId!);
  return response;
}

@riverpod
Future<List<String>> getUnsubscribe(GetUnsubscribeRef ref, int count) async {
  final db = ref.read(getDatabaseProvider);
  final followerTime = await ref.watch(getFollowerTimeProvider.future);
  final userId = await ref.watch(selfAccountProvider.future);
  final time = followerTime[followerTime.length - count];
  final timeBefore = followerTime[followerTime.length - count - 1];

  final userList = await db.follower(userId: userId!, time: time);
  final userListBefore = await db.follower(userId: userId, time: timeBefore);

  return userListBefore.where(userList.contains).toList();
}

@riverpod
Future<UserTableData> getUser(GetUserRef ref, String id) async {
  final db = ref.read(getDatabaseProvider);
  final response = await db.user(userId: id);
  return response;
}
