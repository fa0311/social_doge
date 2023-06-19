// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core.dart';

// ignore_for_file: type=lint
class $UserDBTable extends UserDB with TableInfo<$UserDBTable, UserDBData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserDBTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
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
  static const VerificationMeta _lastUpdatedMeta =
      const VerificationMeta('lastUpdated');
  @override
  late final GeneratedColumn<DateTime> lastUpdated = GeneratedColumn<DateTime>(
      'last_updated', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        twitterId,
        screenName,
        name,
        description,
        profileImageUrl,
        profileBannerUrl,
        lastUpdated
      ];
  @override
  String get aliasedName => _alias ?? 'user_d_b';
  @override
  String get actualTableName => 'user_d_b';
  @override
  VerificationContext validateIntegrity(Insertable<UserDBData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
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
    if (data.containsKey('last_updated')) {
      context.handle(
          _lastUpdatedMeta,
          lastUpdated.isAcceptableOrUnknown(
              data['last_updated']!, _lastUpdatedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserDBData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserDBData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
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
      lastUpdated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_updated']),
    );
  }

  @override
  $UserDBTable createAlias(String alias) {
    return $UserDBTable(attachedDatabase, alias);
  }
}

class UserDBData extends DataClass implements Insertable<UserDBData> {
  final int id;
  final String twitterId;
  final String screenName;
  final String name;
  final String description;
  final String profileImageUrl;
  final String? profileBannerUrl;
  final DateTime? lastUpdated;
  const UserDBData(
      {required this.id,
      required this.twitterId,
      required this.screenName,
      required this.name,
      required this.description,
      required this.profileImageUrl,
      this.profileBannerUrl,
      this.lastUpdated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['twitter_id'] = Variable<String>(twitterId);
    map['screen_name'] = Variable<String>(screenName);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['profile_image_url'] = Variable<String>(profileImageUrl);
    if (!nullToAbsent || profileBannerUrl != null) {
      map['profile_banner_url'] = Variable<String>(profileBannerUrl);
    }
    if (!nullToAbsent || lastUpdated != null) {
      map['last_updated'] = Variable<DateTime>(lastUpdated);
    }
    return map;
  }

  UserDBCompanion toCompanion(bool nullToAbsent) {
    return UserDBCompanion(
      id: Value(id),
      twitterId: Value(twitterId),
      screenName: Value(screenName),
      name: Value(name),
      description: Value(description),
      profileImageUrl: Value(profileImageUrl),
      profileBannerUrl: profileBannerUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(profileBannerUrl),
      lastUpdated: lastUpdated == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdated),
    );
  }

  factory UserDBData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserDBData(
      id: serializer.fromJson<int>(json['id']),
      twitterId: serializer.fromJson<String>(json['twitterId']),
      screenName: serializer.fromJson<String>(json['screenName']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      profileImageUrl: serializer.fromJson<String>(json['profileImageUrl']),
      profileBannerUrl: serializer.fromJson<String?>(json['profileBannerUrl']),
      lastUpdated: serializer.fromJson<DateTime?>(json['lastUpdated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'twitterId': serializer.toJson<String>(twitterId),
      'screenName': serializer.toJson<String>(screenName),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'profileImageUrl': serializer.toJson<String>(profileImageUrl),
      'profileBannerUrl': serializer.toJson<String?>(profileBannerUrl),
      'lastUpdated': serializer.toJson<DateTime?>(lastUpdated),
    };
  }

  UserDBData copyWith(
          {int? id,
          String? twitterId,
          String? screenName,
          String? name,
          String? description,
          String? profileImageUrl,
          Value<String?> profileBannerUrl = const Value.absent(),
          Value<DateTime?> lastUpdated = const Value.absent()}) =>
      UserDBData(
        id: id ?? this.id,
        twitterId: twitterId ?? this.twitterId,
        screenName: screenName ?? this.screenName,
        name: name ?? this.name,
        description: description ?? this.description,
        profileImageUrl: profileImageUrl ?? this.profileImageUrl,
        profileBannerUrl: profileBannerUrl.present
            ? profileBannerUrl.value
            : this.profileBannerUrl,
        lastUpdated: lastUpdated.present ? lastUpdated.value : this.lastUpdated,
      );
  @override
  String toString() {
    return (StringBuffer('UserDBData(')
          ..write('id: $id, ')
          ..write('twitterId: $twitterId, ')
          ..write('screenName: $screenName, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('profileImageUrl: $profileImageUrl, ')
          ..write('profileBannerUrl: $profileBannerUrl, ')
          ..write('lastUpdated: $lastUpdated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, twitterId, screenName, name, description,
      profileImageUrl, profileBannerUrl, lastUpdated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserDBData &&
          other.id == this.id &&
          other.twitterId == this.twitterId &&
          other.screenName == this.screenName &&
          other.name == this.name &&
          other.description == this.description &&
          other.profileImageUrl == this.profileImageUrl &&
          other.profileBannerUrl == this.profileBannerUrl &&
          other.lastUpdated == this.lastUpdated);
}

class UserDBCompanion extends UpdateCompanion<UserDBData> {
  final Value<int> id;
  final Value<String> twitterId;
  final Value<String> screenName;
  final Value<String> name;
  final Value<String> description;
  final Value<String> profileImageUrl;
  final Value<String?> profileBannerUrl;
  final Value<DateTime?> lastUpdated;
  const UserDBCompanion({
    this.id = const Value.absent(),
    this.twitterId = const Value.absent(),
    this.screenName = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.profileImageUrl = const Value.absent(),
    this.profileBannerUrl = const Value.absent(),
    this.lastUpdated = const Value.absent(),
  });
  UserDBCompanion.insert({
    this.id = const Value.absent(),
    required String twitterId,
    required String screenName,
    required String name,
    required String description,
    required String profileImageUrl,
    this.profileBannerUrl = const Value.absent(),
    this.lastUpdated = const Value.absent(),
  })  : twitterId = Value(twitterId),
        screenName = Value(screenName),
        name = Value(name),
        description = Value(description),
        profileImageUrl = Value(profileImageUrl);
  static Insertable<UserDBData> custom({
    Expression<int>? id,
    Expression<String>? twitterId,
    Expression<String>? screenName,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? profileImageUrl,
    Expression<String>? profileBannerUrl,
    Expression<DateTime>? lastUpdated,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (twitterId != null) 'twitter_id': twitterId,
      if (screenName != null) 'screen_name': screenName,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (profileImageUrl != null) 'profile_image_url': profileImageUrl,
      if (profileBannerUrl != null) 'profile_banner_url': profileBannerUrl,
      if (lastUpdated != null) 'last_updated': lastUpdated,
    });
  }

  UserDBCompanion copyWith(
      {Value<int>? id,
      Value<String>? twitterId,
      Value<String>? screenName,
      Value<String>? name,
      Value<String>? description,
      Value<String>? profileImageUrl,
      Value<String?>? profileBannerUrl,
      Value<DateTime?>? lastUpdated}) {
    return UserDBCompanion(
      id: id ?? this.id,
      twitterId: twitterId ?? this.twitterId,
      screenName: screenName ?? this.screenName,
      name: name ?? this.name,
      description: description ?? this.description,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      profileBannerUrl: profileBannerUrl ?? this.profileBannerUrl,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
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
    if (lastUpdated.present) {
      map['last_updated'] = Variable<DateTime>(lastUpdated.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserDBCompanion(')
          ..write('id: $id, ')
          ..write('twitterId: $twitterId, ')
          ..write('screenName: $screenName, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('profileImageUrl: $profileImageUrl, ')
          ..write('profileBannerUrl: $profileBannerUrl, ')
          ..write('lastUpdated: $lastUpdated')
          ..write(')'))
        .toString();
  }
}

abstract class _$TwitterDatabase extends GeneratedDatabase {
  _$TwitterDatabase(QueryExecutor e) : super(e);
  late final $UserDBTable userDB = $UserDBTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [userDB];
}
