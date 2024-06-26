import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:social_doge/infrastructure/database/data.dart';
import 'package:social_doge/infrastructure/database/table.dart';

part 'core.g.dart';

@DriftDatabase(
  tables: [
    UserTable,
    UserFollowerTable,
    UserFollowingTable,
    SelfAccountTable,
    SyncFollowerTable,
    SyncFollowingTable,
  ],
)
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

  Future<UserTableData> getUser({required String twitterId}) {
    final query = select(userTable)
      ..where((t) => t.twitterId.equals(twitterId))
      ..limit(1);
    return query.getSingle();
  }

  Future<int> upsertUser(UserTableCompanion entry) {
    return into(userTable).insertOnConflictUpdate(entry);
  }

  /* UserStatus*/

  Future<int> addUserStatus({
    required UserStatusData entry,
    required SynchronizeMode mode,
  }) {
    switch (mode) {
      case SynchronizeMode.following:
        return into(userFollowingTable).insert(
          UserFollowingTableCompanion.insert(
            twitterId: entry.twitterId,
            selfTwitterId: entry.selfTwitterId,
            time: entry.time,
          ),
        );
      case SynchronizeMode.follower:
        return into(userFollowerTable).insert(
          UserFollowerTableCompanion.insert(
            twitterId: entry.twitterId,
            selfTwitterId: entry.selfTwitterId,
            time: entry.time,
          ),
        );
    }
  }

  Future<List<UserTableData>> getUserStatus({
    required String userId,
    required DateTime time,
    required SynchronizeMode mode,
  }) {
    switch (mode) {
      case SynchronizeMode.following:
        final query = select(userTable).join([
          innerJoin(userFollowingTable, userTable.twitterId.equalsExp(userFollowingTable.twitterId)),
        ])
          ..where(userFollowingTable.selfTwitterId.equals(userId))
          ..where(userFollowingTable.time.equals(time));
        return query.map((e) => e.readTable(userTable)).get();

      case SynchronizeMode.follower:
        final query = select(userTable).join([
          innerJoin(userFollowerTable, userTable.twitterId.equalsExp(userFollowerTable.twitterId)),
        ])
          ..where(userFollowerTable.selfTwitterId.equals(userId))
          ..where(userFollowerTable.time.equals(time));
        return query.map((e) => e.readTable(userTable)).get();
    }
  }

  Future<int> addUserSyncStatus({
    required SyncStatusData entry,
    required SynchronizeMode mode,
  }) {
    switch (mode) {
      case SynchronizeMode.following:
        return into(syncFollowingTable).insert(
          SyncFollowingTableCompanion.insert(
            selfTwitterId: entry.selfTwitterId,
            time: entry.time,
            count: entry.count,
          ),
        );
      case SynchronizeMode.follower:
        return into(syncFollowerTable).insert(
          SyncFollowerTableCompanion.insert(
            selfTwitterId: entry.selfTwitterId,
            time: entry.time,
            count: entry.count,
          ),
        );
    }
  }

  Future<List<SyncStatusData>> getUserSyncStatus({
    required String userId,
    required SynchronizeMode mode,
  }) {
    switch (mode) {
      case SynchronizeMode.following:
        final query = select(syncFollowingTable)
          ..where((t) => t.selfTwitterId.equals(userId))
          ..orderBy([(t) => OrderingTerm(expression: t.time)]);
        return query.get();
      case SynchronizeMode.follower:
        final query = select(syncFollowerTable)
          ..where((t) => t.selfTwitterId.equals(userId))
          ..orderBy([(t) => OrderingTerm(expression: t.time)]);
        return query.get();
    }
  }

  Future<int> removeUserSyncStatus({
    required String userId,
    required SynchronizeMode mode,
    required DateTime time,
  }) {
    switch (mode) {
      case SynchronizeMode.following:
        return (delete(syncFollowingTable)
              ..where((t) => t.selfTwitterId.equals(userId))
              ..where((t) => t.time.equals(time)))
            .go();
      case SynchronizeMode.follower:
        return (delete(syncFollowerTable)
              ..where((t) => t.selfTwitterId.equals(userId))
              ..where((t) => t.time.equals(time)))
            .go();
    }
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
