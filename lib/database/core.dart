import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'core.g.dart';

class UserTable extends Table {
  TextColumn get twitterId => text().unique()();
  TextColumn get screenName => text()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  TextColumn get profileImageUrl => text()();
  TextColumn get profileBannerUrl => text().nullable()();
  IntColumn get followersCount => integer()();
  IntColumn get friendsCount => integer()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get lastUpdated => dateTime()();

  @override
  Set<Column> get primaryKey => {twitterId};
}

class UserFollowersTable extends Table {
  TextColumn get twitterId => text()();
  TextColumn get selfTwitterId => text()();
  DateTimeColumn get time => dateTime()();
  @override
  Set<Column> get primaryKey => {twitterId, selfTwitterId};
}

class SelfAccountTable extends Table {
  TextColumn get selfTwitterId => text().unique()();
  DateTimeColumn get loginTime => dateTime()();

  @override
  Set<Column> get primaryKey => {selfTwitterId};
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

  Future<int> addAccount(SelfAccountTableCompanion entry) {
    return into(selfAccountTable).insert(entry);
  }

  Future<bool> updateAccount(SelfAccountTableData entry) {
    return update(selfAccountTable).replace(entry);
  }

  /* UserTable */

  Future<UserTableData?> getUser({required String twitterId}) {
    final query = select(userTable)
      ..where((t) => t.twitterId.equals(twitterId))
      ..limit(1);
    return query.getSingleOrNull();
  }

  Future<int> addUser(UserTableCompanion entry) {
    return into(userTable).insert(entry);
  }

  Future<bool> updateUser(UserTableData entry) {
    return update(userTable).replace(entry);
  }

  /* UserFollowersTable */

  Future<int> addFollowers(UserFollowersTableCompanion entry) {
    return into(userFollowersTable).insert(entry);
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

@Riverpod(keepAlive: true)
SocialDogeDatabase getDatabase(GetDatabaseRef ref) {
  return SocialDogeDatabase();
}
