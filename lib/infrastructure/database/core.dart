import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:social_doge/infrastructure/database/data.dart';
import 'package:social_doge/infrastructure/database/table.dart';

part 'core.g.dart';

class FollowerCount {
  FollowerCount(this.time, this.count);
  final DateTime time;
  final int count;
}

@DriftDatabase(tables: [UserTable, UserFollowerTable, UserFollowTable, SelfAccountTable])
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

  Future<UserTableData> user({required String userId}) {
    final query = select(userTable)
      ..where((t) => t.twitterId.equals(userId))
      ..limit(1);
    return query.getSingle();
  }

  /* sync */

  Future<List<FollowerCount>> followerCountByTime({
    required String userId,
    required Duration duration,
    OrderingMode mode = OrderingMode.asc,
  }) {
    final time = DateTime.now().subtract(duration);
    final query = selectOnly(userFollowerTable)
      ..addColumns([userFollowerTable.time, userFollowerTable.twitterId.count()])
      ..where(userFollowerTable.selfTwitterId.equals(userId))
      ..groupBy([userFollowerTable.time], having: userFollowerTable.time.isBiggerThanValue(time))
      ..orderBy([OrderingTerm(expression: userFollowerTable.twitterId, mode: mode)]);
    return query.map((row) => FollowerCount(row.read(userFollowerTable.time)!, row.read(userFollowerTable.twitterId.count())!)).get();
  }

  Future<List<DateTime>> followerTime({
    required String userId,
    OrderingMode mode = OrderingMode.asc,
  }) {
    final query = selectOnly(userFollowerTable)
      ..addColumns([userFollowerTable.time, userFollowerTable.twitterId.count()])
      ..where(userFollowerTable.selfTwitterId.equals(userId))
      ..groupBy([userFollowerTable.time])
      ..orderBy([OrderingTerm(expression: userFollowerTable.twitterId, mode: mode)]);
    return query.map((row) => row.read(userFollowerTable.time)!).get();
  }

  // Future<DateTime> FollowerLastTime({
  //   required String userId,
  //   OrderingMode mode = OrderingMode.asc,
  // }) {
  //   final query = selectOnly(userFollowerTable)
  //     ..addColumns([userFollowerTable.time])
  //     ..where(userFollowerTable.selfTwitterId.equals(userId))
  //     ..groupBy([userFollowerTable.time])
  //     ..orderBy([OrderingTerm(expression: userFollowerTable.twitterId, mode: mode)])
  //     ..limit(1);
  //   return query.map((row) => row.read(userFollowerTable.time)!).getSingle();
  // }

  // Future<List<UserFollowerTableData>> FollowerTest() {
  //   final query = select(userFollowerTable);
  //   return query.get();
  // }

  /* UserFollowerTable */

  Future<int> addFollower(UserFollowerTableCompanion entry) {
    return into(userFollowerTable).insert(entry);
  }

  Future<List<String>> follower({
    required String userId,
    required DateTime time,
    OrderingMode mode = OrderingMode.asc,
  }) {
    final query = selectOnly(userFollowerTable)
      ..addColumns([userFollowerTable.twitterId])
      ..where(userFollowerTable.selfTwitterId.equals(userId) & userFollowerTable.time.equals(time));
    return query.map((row) => row.read(userFollowerTable.twitterId)!).get();
  }

  Future<int> deleteFollower({
    required String userId,
    required DateTime time,
  }) {
    final query = delete(userFollowerTable)..where((t) => t.selfTwitterId.equals(userId) & t.time.equals(time));
    return query.go();
  }

  /* UserFollowTable */

  Future<int> addFollow(UserFollowTableCompanion entry) {
    return into(userFollowTable).insert(entry);
  }

  Future<List<String>> follow({
    required String userId,
    required DateTime time,
    OrderingMode mode = OrderingMode.asc,
  }) {
    final query = selectOnly(userFollowTable)
      ..addColumns([userFollowTable.twitterId])
      ..where(userFollowTable.selfTwitterId.equals(userId) & userFollowTable.time.equals(time));
    return query.map((row) => row.read(userFollowTable.twitterId)!).get();
  }

  Future<int> deleteFollow({
    required String userId,
    required DateTime time,
  }) {
    final query = delete(userFollowTable)..where((t) => t.selfTwitterId.equals(userId) & t.time.equals(time));
    return query.go();
  }

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(join(dbFolder.path, 'db.sqlite'));
    // if (file.existsSync()) {
    //   await file.delete();
    // }
    return NativeDatabase.createInBackground(file);
  });
}
