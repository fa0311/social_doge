import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:social_doge/infrastructure/database/data.dart';
import 'package:social_doge/infrastructure/database/table.dart';

part 'core.g.dart';

class FollowersCount {
  FollowersCount(this.time, this.count);
  final DateTime time;
  final int count;
}

@DriftDatabase(tables: [UserTable, UserFollowersTable, SelfAccountTable])
class SocialDogeDatabase extends _$SocialDogeDatabase {
  SocialDogeDatabase() : super(_openConnection());

  /* SelfAccountTable */

  Future<SelfAccountTableData?> loginAccount() {
    final query = select(selfAccountTable)
      ..orderBy([(t) => OrderingTerm(expression: t.loginTime, mode: OrderingMode.desc)])
      ..limit(1);
    return query.getSingleOrNull();
  }

  Future<int> upsertAccount(SelfAccountTableCompanion entry) {
    return into(selfAccountTable).insertOnConflictUpdate(entry);
  }

  /* UserTable */

  Future<UserTableData?> getUser({required String twitterId}) {
    final query = select(userTable)
      ..where((t) => t.twitterId.equals(twitterId))
      ..limit(1);
    return query.getSingleOrNull();
  }

  Future<int> upsertUser(UserTableCompanion entry) {
    return into(userTable).insertOnConflictUpdate(entry);
  }

  /* UserFollowersTable */

  Future<int> addFollowers(UserFollowersTableCompanion entry) {
    return into(userFollowersTable).insert(entry);
  }

  Future<List<FollowersCount>> followersCountByTime({
    required String userId,
    required Duration duration,
    OrderingMode mode = OrderingMode.asc,
  }) {
    final time = DateTime.now().subtract(duration);
    final query = selectOnly(userFollowersTable)
      ..addColumns([userFollowersTable.time, userFollowersTable.twitterId.count()])
      ..where(userFollowersTable.selfTwitterId.equals(userId))
      ..groupBy([userFollowersTable.time], having: userFollowersTable.time.isBiggerThanValue(time))
      ..orderBy([OrderingTerm(expression: userFollowersTable.twitterId, mode: mode)]);
    return query.map((row) => FollowersCount(row.read(userFollowersTable.time)!, row.read(userFollowersTable.twitterId.count())!)).get();
  }

  Future<List<UserFollowersTableData>> followersTest() {
    final query = select(userFollowersTable);
    return query.get();
  }

  Future<List<String>> followers({
    required String userId,
    required DateTime time,
    OrderingMode mode = OrderingMode.asc,
  }) {
    final query = selectOnly(userFollowersTable)
      ..addColumns([userFollowersTable.twitterId])
      ..where(userFollowersTable.selfTwitterId.equals(userId) & userFollowersTable.time.equals(time));
    return query.map((row) => row.read(userFollowersTable.twitterId)!).get();
  }

  Future<List<DateTime>> followersTime({
    required String userId,
    OrderingMode mode = OrderingMode.asc,
  }) {
    final query = selectOnly(userFollowersTable)
      ..addColumns([userFollowersTable.time, userFollowersTable.twitterId.count()])
      ..where(userFollowersTable.selfTwitterId.equals(userId))
      ..groupBy([userFollowersTable.time])
      ..orderBy([OrderingTerm(expression: userFollowersTable.twitterId, mode: mode)]);
    return query.map((row) => row.read(userFollowersTable.time)!).get();
  }

  Future<DateTime> followersLastTime({
    required String userId,
    OrderingMode mode = OrderingMode.asc,
  }) {
    final query = selectOnly(userFollowersTable)
      ..addColumns([userFollowersTable.time])
      ..where(userFollowersTable.selfTwitterId.equals(userId))
      ..groupBy([userFollowersTable.time])
      ..orderBy([OrderingTerm(expression: userFollowersTable.twitterId, mode: mode)])
      ..limit(1);
    return query.map((row) => row.read(userFollowersTable.time)!).getSingle();
  }

  Future<int> deleteFollowers({
    required String userId,
    required DateTime time,
  }) {
    final query = delete(userFollowersTable)..where((t) => t.selfTwitterId.equals(userId) & t.time.equals(time));
    return query.go();
  }

  Future<UserTableData> user({required String userId}) {
    final query = select(userTable)
      ..where((t) => t.twitterId.equals(userId))
      ..limit(1);
    return query.getSingle();
  }

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
