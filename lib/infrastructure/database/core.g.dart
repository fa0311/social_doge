// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core.dart';

// ignore_for_file: type=lint
class $UserTableTable extends UserTable
    with TableInfo<$UserTableTable, UserTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _twitterIdMeta =
      const VerificationMeta('twitterId');
  @override
  late final GeneratedColumn<String> twitterId = GeneratedColumn<String>(
      'twitter_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _screenNameMeta =
      const VerificationMeta('screenName');
  @override
  late final GeneratedColumn<String> screenName = GeneratedColumn<String>(
      'screen_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _profileImageUrlMeta =
      const VerificationMeta('profileImageUrl');
  @override
  late final GeneratedColumn<String> profileImageUrl = GeneratedColumn<String>(
      'profile_image_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _profileBannerUrlMeta =
      const VerificationMeta('profileBannerUrl');
  @override
  late final GeneratedColumn<String> profileBannerUrl = GeneratedColumn<String>(
      'profile_banner_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _followerCountMeta =
      const VerificationMeta('followerCount');
  @override
  late final GeneratedColumn<int> followerCount = GeneratedColumn<int>(
      'follower_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _followingCountMeta =
      const VerificationMeta('followingCount');
  @override
  late final GeneratedColumn<int> followingCount = GeneratedColumn<int>(
      'following_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _lastUpdatedMeta =
      const VerificationMeta('lastUpdated');
  @override
  late final GeneratedColumn<DateTime> lastUpdated = GeneratedColumn<DateTime>(
      'last_updated', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        twitterId,
        screenName,
        name,
        description,
        profileImageUrl,
        profileBannerUrl,
        followerCount,
        followingCount,
        createdAt,
        lastUpdated
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_table';
  @override
  VerificationContext validateIntegrity(Insertable<UserTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('twitter_id')) {
      context.handle(_twitterIdMeta,
          twitterId.isAcceptableOrUnknown(data['twitter_id']!, _twitterIdMeta));
    } else if (isInserting) {
      context.missing(_twitterIdMeta);
    }
    if (data.containsKey('screen_name')) {
      context.handle(
          _screenNameMeta,
          screenName.isAcceptableOrUnknown(
              data['screen_name']!, _screenNameMeta));
    } else if (isInserting) {
      context.missing(_screenNameMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('profile_image_url')) {
      context.handle(
          _profileImageUrlMeta,
          profileImageUrl.isAcceptableOrUnknown(
              data['profile_image_url']!, _profileImageUrlMeta));
    } else if (isInserting) {
      context.missing(_profileImageUrlMeta);
    }
    if (data.containsKey('profile_banner_url')) {
      context.handle(
          _profileBannerUrlMeta,
          profileBannerUrl.isAcceptableOrUnknown(
              data['profile_banner_url']!, _profileBannerUrlMeta));
    }
    if (data.containsKey('follower_count')) {
      context.handle(
          _followerCountMeta,
          followerCount.isAcceptableOrUnknown(
              data['follower_count']!, _followerCountMeta));
    } else if (isInserting) {
      context.missing(_followerCountMeta);
    }
    if (data.containsKey('following_count')) {
      context.handle(
          _followingCountMeta,
          followingCount.isAcceptableOrUnknown(
              data['following_count']!, _followingCountMeta));
    } else if (isInserting) {
      context.missing(_followingCountMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('last_updated')) {
      context.handle(
          _lastUpdatedMeta,
          lastUpdated.isAcceptableOrUnknown(
              data['last_updated']!, _lastUpdatedMeta));
    } else if (isInserting) {
      context.missing(_lastUpdatedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {twitterId};
  @override
  UserTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserTableData(
      twitterId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}twitter_id'])!,
      screenName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}screen_name'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      profileImageUrl: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}profile_image_url'])!,
      profileBannerUrl: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}profile_banner_url']),
      followerCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}follower_count'])!,
      followingCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}following_count'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      lastUpdated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_updated'])!,
    );
  }

  @override
  $UserTableTable createAlias(String alias) {
    return $UserTableTable(attachedDatabase, alias);
  }
}

class UserTableCompanion extends UpdateCompanion<UserTableData> {
  final Value<String> twitterId;
  final Value<String> screenName;
  final Value<String> name;
  final Value<String> description;
  final Value<String> profileImageUrl;
  final Value<String?> profileBannerUrl;
  final Value<int> followerCount;
  final Value<int> followingCount;
  final Value<DateTime> createdAt;
  final Value<DateTime> lastUpdated;
  final Value<int> rowid;
  const UserTableCompanion({
    this.twitterId = const Value.absent(),
    this.screenName = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.profileImageUrl = const Value.absent(),
    this.profileBannerUrl = const Value.absent(),
    this.followerCount = const Value.absent(),
    this.followingCount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserTableCompanion.insert({
    required String twitterId,
    required String screenName,
    required String name,
    required String description,
    required String profileImageUrl,
    this.profileBannerUrl = const Value.absent(),
    required int followerCount,
    required int followingCount,
    required DateTime createdAt,
    required DateTime lastUpdated,
    this.rowid = const Value.absent(),
  })  : twitterId = Value(twitterId),
        screenName = Value(screenName),
        name = Value(name),
        description = Value(description),
        profileImageUrl = Value(profileImageUrl),
        followerCount = Value(followerCount),
        followingCount = Value(followingCount),
        createdAt = Value(createdAt),
        lastUpdated = Value(lastUpdated);
  static Insertable<UserTableData> custom({
    Expression<String>? twitterId,
    Expression<String>? screenName,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? profileImageUrl,
    Expression<String>? profileBannerUrl,
    Expression<int>? followerCount,
    Expression<int>? followingCount,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? lastUpdated,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (twitterId != null) 'twitter_id': twitterId,
      if (screenName != null) 'screen_name': screenName,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (profileImageUrl != null) 'profile_image_url': profileImageUrl,
      if (profileBannerUrl != null) 'profile_banner_url': profileBannerUrl,
      if (followerCount != null) 'follower_count': followerCount,
      if (followingCount != null) 'following_count': followingCount,
      if (createdAt != null) 'created_at': createdAt,
      if (lastUpdated != null) 'last_updated': lastUpdated,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserTableCompanion copyWith(
      {Value<String>? twitterId,
      Value<String>? screenName,
      Value<String>? name,
      Value<String>? description,
      Value<String>? profileImageUrl,
      Value<String?>? profileBannerUrl,
      Value<int>? followerCount,
      Value<int>? followingCount,
      Value<DateTime>? createdAt,
      Value<DateTime>? lastUpdated,
      Value<int>? rowid}) {
    return UserTableCompanion(
      twitterId: twitterId ?? this.twitterId,
      screenName: screenName ?? this.screenName,
      name: name ?? this.name,
      description: description ?? this.description,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      profileBannerUrl: profileBannerUrl ?? this.profileBannerUrl,
      followerCount: followerCount ?? this.followerCount,
      followingCount: followingCount ?? this.followingCount,
      createdAt: createdAt ?? this.createdAt,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (twitterId.present) {
      map['twitter_id'] = Variable<String>(twitterId.value);
    }
    if (screenName.present) {
      map['screen_name'] = Variable<String>(screenName.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (profileImageUrl.present) {
      map['profile_image_url'] = Variable<String>(profileImageUrl.value);
    }
    if (profileBannerUrl.present) {
      map['profile_banner_url'] = Variable<String>(profileBannerUrl.value);
    }
    if (followerCount.present) {
      map['follower_count'] = Variable<int>(followerCount.value);
    }
    if (followingCount.present) {
      map['following_count'] = Variable<int>(followingCount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (lastUpdated.present) {
      map['last_updated'] = Variable<DateTime>(lastUpdated.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserTableCompanion(')
          ..write('twitterId: $twitterId, ')
          ..write('screenName: $screenName, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('profileImageUrl: $profileImageUrl, ')
          ..write('profileBannerUrl: $profileBannerUrl, ')
          ..write('followerCount: $followerCount, ')
          ..write('followingCount: $followingCount, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserFollowerTableTable extends UserFollowerTable
    with TableInfo<$UserFollowerTableTable, UserStatusData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserFollowerTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<int> key = GeneratedColumn<int>(
      'key', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _twitterIdMeta =
      const VerificationMeta('twitterId');
  @override
  late final GeneratedColumn<String> twitterId = GeneratedColumn<String>(
      'twitter_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _selfTwitterIdMeta =
      const VerificationMeta('selfTwitterId');
  @override
  late final GeneratedColumn<String> selfTwitterId = GeneratedColumn<String>(
      'self_twitter_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<DateTime> time = GeneratedColumn<DateTime>(
      'time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [key, twitterId, selfTwitterId, time];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_follower_table';
  @override
  VerificationContext validateIntegrity(Insertable<UserStatusData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    }
    if (data.containsKey('twitter_id')) {
      context.handle(_twitterIdMeta,
          twitterId.isAcceptableOrUnknown(data['twitter_id']!, _twitterIdMeta));
    } else if (isInserting) {
      context.missing(_twitterIdMeta);
    }
    if (data.containsKey('self_twitter_id')) {
      context.handle(
          _selfTwitterIdMeta,
          selfTwitterId.isAcceptableOrUnknown(
              data['self_twitter_id']!, _selfTwitterIdMeta));
    } else if (isInserting) {
      context.missing(_selfTwitterIdMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  UserStatusData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserStatusData(
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}key'])!,
      twitterId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}twitter_id'])!,
      selfTwitterId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}self_twitter_id'])!,
      time: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}time'])!,
    );
  }

  @override
  $UserFollowerTableTable createAlias(String alias) {
    return $UserFollowerTableTable(attachedDatabase, alias);
  }
}

class UserFollowerTableCompanion extends UpdateCompanion<UserStatusData> {
  final Value<int> key;
  final Value<String> twitterId;
  final Value<String> selfTwitterId;
  final Value<DateTime> time;
  const UserFollowerTableCompanion({
    this.key = const Value.absent(),
    this.twitterId = const Value.absent(),
    this.selfTwitterId = const Value.absent(),
    this.time = const Value.absent(),
  });
  UserFollowerTableCompanion.insert({
    this.key = const Value.absent(),
    required String twitterId,
    required String selfTwitterId,
    required DateTime time,
  })  : twitterId = Value(twitterId),
        selfTwitterId = Value(selfTwitterId),
        time = Value(time);
  static Insertable<UserStatusData> custom({
    Expression<int>? key,
    Expression<String>? twitterId,
    Expression<String>? selfTwitterId,
    Expression<DateTime>? time,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (twitterId != null) 'twitter_id': twitterId,
      if (selfTwitterId != null) 'self_twitter_id': selfTwitterId,
      if (time != null) 'time': time,
    });
  }

  UserFollowerTableCompanion copyWith(
      {Value<int>? key,
      Value<String>? twitterId,
      Value<String>? selfTwitterId,
      Value<DateTime>? time}) {
    return UserFollowerTableCompanion(
      key: key ?? this.key,
      twitterId: twitterId ?? this.twitterId,
      selfTwitterId: selfTwitterId ?? this.selfTwitterId,
      time: time ?? this.time,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<int>(key.value);
    }
    if (twitterId.present) {
      map['twitter_id'] = Variable<String>(twitterId.value);
    }
    if (selfTwitterId.present) {
      map['self_twitter_id'] = Variable<String>(selfTwitterId.value);
    }
    if (time.present) {
      map['time'] = Variable<DateTime>(time.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserFollowerTableCompanion(')
          ..write('key: $key, ')
          ..write('twitterId: $twitterId, ')
          ..write('selfTwitterId: $selfTwitterId, ')
          ..write('time: $time')
          ..write(')'))
        .toString();
  }
}

class $UserFollowingTableTable extends UserFollowingTable
    with TableInfo<$UserFollowingTableTable, UserStatusData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserFollowingTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<int> key = GeneratedColumn<int>(
      'key', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _twitterIdMeta =
      const VerificationMeta('twitterId');
  @override
  late final GeneratedColumn<String> twitterId = GeneratedColumn<String>(
      'twitter_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _selfTwitterIdMeta =
      const VerificationMeta('selfTwitterId');
  @override
  late final GeneratedColumn<String> selfTwitterId = GeneratedColumn<String>(
      'self_twitter_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<DateTime> time = GeneratedColumn<DateTime>(
      'time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [key, twitterId, selfTwitterId, time];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_following_table';
  @override
  VerificationContext validateIntegrity(Insertable<UserStatusData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    }
    if (data.containsKey('twitter_id')) {
      context.handle(_twitterIdMeta,
          twitterId.isAcceptableOrUnknown(data['twitter_id']!, _twitterIdMeta));
    } else if (isInserting) {
      context.missing(_twitterIdMeta);
    }
    if (data.containsKey('self_twitter_id')) {
      context.handle(
          _selfTwitterIdMeta,
          selfTwitterId.isAcceptableOrUnknown(
              data['self_twitter_id']!, _selfTwitterIdMeta));
    } else if (isInserting) {
      context.missing(_selfTwitterIdMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  UserStatusData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserStatusData(
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}key'])!,
      twitterId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}twitter_id'])!,
      selfTwitterId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}self_twitter_id'])!,
      time: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}time'])!,
    );
  }

  @override
  $UserFollowingTableTable createAlias(String alias) {
    return $UserFollowingTableTable(attachedDatabase, alias);
  }
}

class UserFollowingTableCompanion extends UpdateCompanion<UserStatusData> {
  final Value<int> key;
  final Value<String> twitterId;
  final Value<String> selfTwitterId;
  final Value<DateTime> time;
  const UserFollowingTableCompanion({
    this.key = const Value.absent(),
    this.twitterId = const Value.absent(),
    this.selfTwitterId = const Value.absent(),
    this.time = const Value.absent(),
  });
  UserFollowingTableCompanion.insert({
    this.key = const Value.absent(),
    required String twitterId,
    required String selfTwitterId,
    required DateTime time,
  })  : twitterId = Value(twitterId),
        selfTwitterId = Value(selfTwitterId),
        time = Value(time);
  static Insertable<UserStatusData> custom({
    Expression<int>? key,
    Expression<String>? twitterId,
    Expression<String>? selfTwitterId,
    Expression<DateTime>? time,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (twitterId != null) 'twitter_id': twitterId,
      if (selfTwitterId != null) 'self_twitter_id': selfTwitterId,
      if (time != null) 'time': time,
    });
  }

  UserFollowingTableCompanion copyWith(
      {Value<int>? key,
      Value<String>? twitterId,
      Value<String>? selfTwitterId,
      Value<DateTime>? time}) {
    return UserFollowingTableCompanion(
      key: key ?? this.key,
      twitterId: twitterId ?? this.twitterId,
      selfTwitterId: selfTwitterId ?? this.selfTwitterId,
      time: time ?? this.time,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<int>(key.value);
    }
    if (twitterId.present) {
      map['twitter_id'] = Variable<String>(twitterId.value);
    }
    if (selfTwitterId.present) {
      map['self_twitter_id'] = Variable<String>(selfTwitterId.value);
    }
    if (time.present) {
      map['time'] = Variable<DateTime>(time.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserFollowingTableCompanion(')
          ..write('key: $key, ')
          ..write('twitterId: $twitterId, ')
          ..write('selfTwitterId: $selfTwitterId, ')
          ..write('time: $time')
          ..write(')'))
        .toString();
  }
}

class $SelfAccountTableTable extends SelfAccountTable
    with TableInfo<$SelfAccountTableTable, SelfAccountTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SelfAccountTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _selfTwitterIdMeta =
      const VerificationMeta('selfTwitterId');
  @override
  late final GeneratedColumn<String> selfTwitterId = GeneratedColumn<String>(
      'self_twitter_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _loginTimeMeta =
      const VerificationMeta('loginTime');
  @override
  late final GeneratedColumn<DateTime> loginTime = GeneratedColumn<DateTime>(
      'login_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [selfTwitterId, loginTime];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'self_account_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<SelfAccountTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('self_twitter_id')) {
      context.handle(
          _selfTwitterIdMeta,
          selfTwitterId.isAcceptableOrUnknown(
              data['self_twitter_id']!, _selfTwitterIdMeta));
    } else if (isInserting) {
      context.missing(_selfTwitterIdMeta);
    }
    if (data.containsKey('login_time')) {
      context.handle(_loginTimeMeta,
          loginTime.isAcceptableOrUnknown(data['login_time']!, _loginTimeMeta));
    } else if (isInserting) {
      context.missing(_loginTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {selfTwitterId};
  @override
  SelfAccountTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SelfAccountTableData(
      selfTwitterId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}self_twitter_id'])!,
      loginTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}login_time'])!,
    );
  }

  @override
  $SelfAccountTableTable createAlias(String alias) {
    return $SelfAccountTableTable(attachedDatabase, alias);
  }
}

class SelfAccountTableData extends DataClass
    implements Insertable<SelfAccountTableData> {
  final String selfTwitterId;
  final DateTime loginTime;
  const SelfAccountTableData(
      {required this.selfTwitterId, required this.loginTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['self_twitter_id'] = Variable<String>(selfTwitterId);
    map['login_time'] = Variable<DateTime>(loginTime);
    return map;
  }

  SelfAccountTableCompanion toCompanion(bool nullToAbsent) {
    return SelfAccountTableCompanion(
      selfTwitterId: Value(selfTwitterId),
      loginTime: Value(loginTime),
    );
  }

  factory SelfAccountTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SelfAccountTableData(
      selfTwitterId: serializer.fromJson<String>(json['selfTwitterId']),
      loginTime: serializer.fromJson<DateTime>(json['loginTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'selfTwitterId': serializer.toJson<String>(selfTwitterId),
      'loginTime': serializer.toJson<DateTime>(loginTime),
    };
  }

  SelfAccountTableData copyWith({String? selfTwitterId, DateTime? loginTime}) =>
      SelfAccountTableData(
        selfTwitterId: selfTwitterId ?? this.selfTwitterId,
        loginTime: loginTime ?? this.loginTime,
      );
  @override
  String toString() {
    return (StringBuffer('SelfAccountTableData(')
          ..write('selfTwitterId: $selfTwitterId, ')
          ..write('loginTime: $loginTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(selfTwitterId, loginTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SelfAccountTableData &&
          other.selfTwitterId == this.selfTwitterId &&
          other.loginTime == this.loginTime);
}

class SelfAccountTableCompanion extends UpdateCompanion<SelfAccountTableData> {
  final Value<String> selfTwitterId;
  final Value<DateTime> loginTime;
  final Value<int> rowid;
  const SelfAccountTableCompanion({
    this.selfTwitterId = const Value.absent(),
    this.loginTime = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SelfAccountTableCompanion.insert({
    required String selfTwitterId,
    required DateTime loginTime,
    this.rowid = const Value.absent(),
  })  : selfTwitterId = Value(selfTwitterId),
        loginTime = Value(loginTime);
  static Insertable<SelfAccountTableData> custom({
    Expression<String>? selfTwitterId,
    Expression<DateTime>? loginTime,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (selfTwitterId != null) 'self_twitter_id': selfTwitterId,
      if (loginTime != null) 'login_time': loginTime,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SelfAccountTableCompanion copyWith(
      {Value<String>? selfTwitterId,
      Value<DateTime>? loginTime,
      Value<int>? rowid}) {
    return SelfAccountTableCompanion(
      selfTwitterId: selfTwitterId ?? this.selfTwitterId,
      loginTime: loginTime ?? this.loginTime,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (selfTwitterId.present) {
      map['self_twitter_id'] = Variable<String>(selfTwitterId.value);
    }
    if (loginTime.present) {
      map['login_time'] = Variable<DateTime>(loginTime.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SelfAccountTableCompanion(')
          ..write('selfTwitterId: $selfTwitterId, ')
          ..write('loginTime: $loginTime, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncFollowerTableTable extends SyncFollowerTable
    with TableInfo<$SyncFollowerTableTable, SyncStatusData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncFollowerTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<int> key = GeneratedColumn<int>(
      'key', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _selfTwitterIdMeta =
      const VerificationMeta('selfTwitterId');
  @override
  late final GeneratedColumn<String> selfTwitterId = GeneratedColumn<String>(
      'self_twitter_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<DateTime> time = GeneratedColumn<DateTime>(
      'time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _countMeta = const VerificationMeta('count');
  @override
  late final GeneratedColumn<int> count = GeneratedColumn<int>(
      'count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [key, selfTwitterId, time, count];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_follower_table';
  @override
  VerificationContext validateIntegrity(Insertable<SyncStatusData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    }
    if (data.containsKey('self_twitter_id')) {
      context.handle(
          _selfTwitterIdMeta,
          selfTwitterId.isAcceptableOrUnknown(
              data['self_twitter_id']!, _selfTwitterIdMeta));
    } else if (isInserting) {
      context.missing(_selfTwitterIdMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    if (data.containsKey('count')) {
      context.handle(
          _countMeta, count.isAcceptableOrUnknown(data['count']!, _countMeta));
    } else if (isInserting) {
      context.missing(_countMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  SyncStatusData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncStatusData(
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}key'])!,
      selfTwitterId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}self_twitter_id'])!,
      time: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}time'])!,
      count: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}count'])!,
    );
  }

  @override
  $SyncFollowerTableTable createAlias(String alias) {
    return $SyncFollowerTableTable(attachedDatabase, alias);
  }
}

class SyncFollowerTableCompanion extends UpdateCompanion<SyncStatusData> {
  final Value<int> key;
  final Value<String> selfTwitterId;
  final Value<DateTime> time;
  final Value<int> count;
  const SyncFollowerTableCompanion({
    this.key = const Value.absent(),
    this.selfTwitterId = const Value.absent(),
    this.time = const Value.absent(),
    this.count = const Value.absent(),
  });
  SyncFollowerTableCompanion.insert({
    this.key = const Value.absent(),
    required String selfTwitterId,
    required DateTime time,
    required int count,
  })  : selfTwitterId = Value(selfTwitterId),
        time = Value(time),
        count = Value(count);
  static Insertable<SyncStatusData> custom({
    Expression<int>? key,
    Expression<String>? selfTwitterId,
    Expression<DateTime>? time,
    Expression<int>? count,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (selfTwitterId != null) 'self_twitter_id': selfTwitterId,
      if (time != null) 'time': time,
      if (count != null) 'count': count,
    });
  }

  SyncFollowerTableCompanion copyWith(
      {Value<int>? key,
      Value<String>? selfTwitterId,
      Value<DateTime>? time,
      Value<int>? count}) {
    return SyncFollowerTableCompanion(
      key: key ?? this.key,
      selfTwitterId: selfTwitterId ?? this.selfTwitterId,
      time: time ?? this.time,
      count: count ?? this.count,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<int>(key.value);
    }
    if (selfTwitterId.present) {
      map['self_twitter_id'] = Variable<String>(selfTwitterId.value);
    }
    if (time.present) {
      map['time'] = Variable<DateTime>(time.value);
    }
    if (count.present) {
      map['count'] = Variable<int>(count.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncFollowerTableCompanion(')
          ..write('key: $key, ')
          ..write('selfTwitterId: $selfTwitterId, ')
          ..write('time: $time, ')
          ..write('count: $count')
          ..write(')'))
        .toString();
  }
}

class $SyncFollowingTableTable extends SyncFollowingTable
    with TableInfo<$SyncFollowingTableTable, SyncStatusData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncFollowingTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<int> key = GeneratedColumn<int>(
      'key', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _selfTwitterIdMeta =
      const VerificationMeta('selfTwitterId');
  @override
  late final GeneratedColumn<String> selfTwitterId = GeneratedColumn<String>(
      'self_twitter_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<DateTime> time = GeneratedColumn<DateTime>(
      'time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _countMeta = const VerificationMeta('count');
  @override
  late final GeneratedColumn<int> count = GeneratedColumn<int>(
      'count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [key, selfTwitterId, time, count];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_following_table';
  @override
  VerificationContext validateIntegrity(Insertable<SyncStatusData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    }
    if (data.containsKey('self_twitter_id')) {
      context.handle(
          _selfTwitterIdMeta,
          selfTwitterId.isAcceptableOrUnknown(
              data['self_twitter_id']!, _selfTwitterIdMeta));
    } else if (isInserting) {
      context.missing(_selfTwitterIdMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    if (data.containsKey('count')) {
      context.handle(
          _countMeta, count.isAcceptableOrUnknown(data['count']!, _countMeta));
    } else if (isInserting) {
      context.missing(_countMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  SyncStatusData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncStatusData(
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}key'])!,
      selfTwitterId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}self_twitter_id'])!,
      time: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}time'])!,
      count: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}count'])!,
    );
  }

  @override
  $SyncFollowingTableTable createAlias(String alias) {
    return $SyncFollowingTableTable(attachedDatabase, alias);
  }
}

class SyncFollowingTableCompanion extends UpdateCompanion<SyncStatusData> {
  final Value<int> key;
  final Value<String> selfTwitterId;
  final Value<DateTime> time;
  final Value<int> count;
  const SyncFollowingTableCompanion({
    this.key = const Value.absent(),
    this.selfTwitterId = const Value.absent(),
    this.time = const Value.absent(),
    this.count = const Value.absent(),
  });
  SyncFollowingTableCompanion.insert({
    this.key = const Value.absent(),
    required String selfTwitterId,
    required DateTime time,
    required int count,
  })  : selfTwitterId = Value(selfTwitterId),
        time = Value(time),
        count = Value(count);
  static Insertable<SyncStatusData> custom({
    Expression<int>? key,
    Expression<String>? selfTwitterId,
    Expression<DateTime>? time,
    Expression<int>? count,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (selfTwitterId != null) 'self_twitter_id': selfTwitterId,
      if (time != null) 'time': time,
      if (count != null) 'count': count,
    });
  }

  SyncFollowingTableCompanion copyWith(
      {Value<int>? key,
      Value<String>? selfTwitterId,
      Value<DateTime>? time,
      Value<int>? count}) {
    return SyncFollowingTableCompanion(
      key: key ?? this.key,
      selfTwitterId: selfTwitterId ?? this.selfTwitterId,
      time: time ?? this.time,
      count: count ?? this.count,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<int>(key.value);
    }
    if (selfTwitterId.present) {
      map['self_twitter_id'] = Variable<String>(selfTwitterId.value);
    }
    if (time.present) {
      map['time'] = Variable<DateTime>(time.value);
    }
    if (count.present) {
      map['count'] = Variable<int>(count.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncFollowingTableCompanion(')
          ..write('key: $key, ')
          ..write('selfTwitterId: $selfTwitterId, ')
          ..write('time: $time, ')
          ..write('count: $count')
          ..write(')'))
        .toString();
  }
}

abstract class _$SocialDogeDatabase extends GeneratedDatabase {
  _$SocialDogeDatabase(QueryExecutor e) : super(e);
  late final $UserTableTable userTable = $UserTableTable(this);
  late final $UserFollowerTableTable userFollowerTable =
      $UserFollowerTableTable(this);
  late final $UserFollowingTableTable userFollowingTable =
      $UserFollowingTableTable(this);
  late final $SelfAccountTableTable selfAccountTable =
      $SelfAccountTableTable(this);
  late final $SyncFollowerTableTable syncFollowerTable =
      $SyncFollowerTableTable(this);
  late final $SyncFollowingTableTable syncFollowingTable =
      $SyncFollowingTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        userTable,
        userFollowerTable,
        userFollowingTable,
        selfAccountTable,
        syncFollowerTable,
        syncFollowingTable
      ];
}
