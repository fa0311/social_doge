import 'package:drift/drift.dart';
import 'package:social_doge/database/data.dart';

@UseRowClass(UserTableData)
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
