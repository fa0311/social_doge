import 'package:drift/drift.dart';
import 'package:social_doge/infrastructure/database/data.dart';

@UseRowClass(UserTableData)
class UserTable extends Table {
  TextColumn get twitterId => text()();
  TextColumn get screenName => text()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  TextColumn get profileImageUrl => text()();
  TextColumn get profileBannerUrl => text().nullable()();
  IntColumn get followerCount => integer()();
  IntColumn get followingCount => integer()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get lastUpdated => dateTime()();

  @override
  Set<Column> get primaryKey => {twitterId};
}

@UseRowClass(UserStatusData)
class UserFollowerTable extends Table {
  IntColumn get key => integer().autoIncrement()();
  TextColumn get twitterId => text()();
  TextColumn get selfTwitterId => text()();
  DateTimeColumn get time => dateTime()();
}

@UseRowClass(UserStatusData)
class UserFollowingTable extends Table {
  IntColumn get key => integer().autoIncrement()();
  TextColumn get twitterId => text()();
  TextColumn get selfTwitterId => text()();
  DateTimeColumn get time => dateTime()();
}

@UseRowClass(SyncStatusData)
class SyncFollowingTable extends Table {
  IntColumn get key => integer().autoIncrement()();
  TextColumn get selfTwitterId => text()();
  DateTimeColumn get time => dateTime()();
  IntColumn get count => integer()();
}

@UseRowClass(SyncStatusData)
class SyncFollowerTable extends Table {
  IntColumn get key => integer().autoIncrement()();
  TextColumn get selfTwitterId => text()();
  DateTimeColumn get time => dateTime()();
  IntColumn get count => integer()();
}

class SelfAccountTable extends Table {
  TextColumn get selfTwitterId => text()();
  DateTimeColumn get loginTime => dateTime()();

  @override
  Set<Column> get primaryKey => {selfTwitterId};
}
