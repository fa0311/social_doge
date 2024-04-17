import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:social_doge/infrastructure/database/core.dart';
import 'package:social_doge/infrastructure/database/data.dart';

part 'db.g.dart';

@Riverpod(keepAlive: true)
SocialDogeDatabase getDatabase(GetDatabaseRef ref) {
  return SocialDogeDatabase();
}

@riverpod
Future<List<DateTime>> getFollowerTime(GetFollowerTimeRef ref) async {
  return <DateTime>[];
}

@riverpod
Future<List<String>> getUnsubscribe(GetUnsubscribeRef ref, int count) async {
  return <String>[];
}

@riverpod
Future<UserTableData> getUser(GetUserRef ref, String id) async {
  final db = ref.read(getDatabaseProvider);
  final response = await db.getUser(twitterId: id);
  return response;
}
