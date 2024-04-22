// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getDatabaseHash() => r'ef5b38e60576647339fab73676bb5b68a949c2c8';

/// See also [getDatabase].
@ProviderFor(getDatabase)
final getDatabaseProvider = Provider<SocialDogeDatabase>.internal(
  getDatabase,
  name: r'getDatabaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetDatabaseRef = ProviderRef<SocialDogeDatabase>;
String _$getUserSyncStatusHash() => r'992c5d2c84af2156f80ede2e530d6be0f6c65862';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getUserSyncStatus].
@ProviderFor(getUserSyncStatus)
const getUserSyncStatusProvider = GetUserSyncStatusFamily();

/// See also [getUserSyncStatus].
class GetUserSyncStatusFamily extends Family<AsyncValue<List<SyncStatusData>>> {
  /// See also [getUserSyncStatus].
  const GetUserSyncStatusFamily();

  /// See also [getUserSyncStatus].
  GetUserSyncStatusProvider call(
    SynchronizeMode mode,
  ) {
    return GetUserSyncStatusProvider(
      mode,
    );
  }

  @override
  GetUserSyncStatusProvider getProviderOverride(
    covariant GetUserSyncStatusProvider provider,
  ) {
    return call(
      provider.mode,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getUserSyncStatusProvider';
}

/// See also [getUserSyncStatus].
class GetUserSyncStatusProvider
    extends AutoDisposeFutureProvider<List<SyncStatusData>> {
  /// See also [getUserSyncStatus].
  GetUserSyncStatusProvider(
    SynchronizeMode mode,
  ) : this._internal(
          (ref) => getUserSyncStatus(
            ref as GetUserSyncStatusRef,
            mode,
          ),
          from: getUserSyncStatusProvider,
          name: r'getUserSyncStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getUserSyncStatusHash,
          dependencies: GetUserSyncStatusFamily._dependencies,
          allTransitiveDependencies:
              GetUserSyncStatusFamily._allTransitiveDependencies,
          mode: mode,
        );

  GetUserSyncStatusProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.mode,
  }) : super.internal();

  final SynchronizeMode mode;

  @override
  Override overrideWith(
    FutureOr<List<SyncStatusData>> Function(GetUserSyncStatusRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetUserSyncStatusProvider._internal(
        (ref) => create(ref as GetUserSyncStatusRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        mode: mode,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<SyncStatusData>> createElement() {
    return _GetUserSyncStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetUserSyncStatusProvider && other.mode == mode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mode.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetUserSyncStatusRef
    on AutoDisposeFutureProviderRef<List<SyncStatusData>> {
  /// The parameter `mode` of this provider.
  SynchronizeMode get mode;
}

class _GetUserSyncStatusProviderElement
    extends AutoDisposeFutureProviderElement<List<SyncStatusData>>
    with GetUserSyncStatusRef {
  _GetUserSyncStatusProviderElement(super.provider);

  @override
  SynchronizeMode get mode => (origin as GetUserSyncStatusProvider).mode;
}

String _$getUserHash() => r'63a95d402406600bc1acec155e62d44263c6b8bd';

/// See also [getUser].
@ProviderFor(getUser)
const getUserProvider = GetUserFamily();

/// See also [getUser].
class GetUserFamily extends Family<AsyncValue<UserTableData>> {
  /// See also [getUser].
  const GetUserFamily();

  /// See also [getUser].
  GetUserProvider call(
    String id,
  ) {
    return GetUserProvider(
      id,
    );
  }

  @override
  GetUserProvider getProviderOverride(
    covariant GetUserProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getUserProvider';
}

/// See also [getUser].
class GetUserProvider extends AutoDisposeFutureProvider<UserTableData> {
  /// See also [getUser].
  GetUserProvider(
    String id,
  ) : this._internal(
          (ref) => getUser(
            ref as GetUserRef,
            id,
          ),
          from: getUserProvider,
          name: r'getUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getUserHash,
          dependencies: GetUserFamily._dependencies,
          allTransitiveDependencies: GetUserFamily._allTransitiveDependencies,
          id: id,
        );

  GetUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<UserTableData> Function(GetUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetUserProvider._internal(
        (ref) => create(ref as GetUserRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<UserTableData> createElement() {
    return _GetUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetUserProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetUserRef on AutoDisposeFutureProviderRef<UserTableData> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetUserProviderElement
    extends AutoDisposeFutureProviderElement<UserTableData> with GetUserRef {
  _GetUserProviderElement(super.provider);

  @override
  String get id => (origin as GetUserProvider).id;
}

String _$getUserStatusHash() => r'186748dcc9c546eb0d38831e883263554619b259';

/// See also [getUserStatus].
@ProviderFor(getUserStatus)
const getUserStatusProvider = GetUserStatusFamily();

/// See also [getUserStatus].
class GetUserStatusFamily extends Family<AsyncValue<List<UserTableData>>> {
  /// See also [getUserStatus].
  const GetUserStatusFamily();

  /// See also [getUserStatus].
  GetUserStatusProvider call(
    DateTime time,
    SynchronizeMode mode,
  ) {
    return GetUserStatusProvider(
      time,
      mode,
    );
  }

  @override
  GetUserStatusProvider getProviderOverride(
    covariant GetUserStatusProvider provider,
  ) {
    return call(
      provider.time,
      provider.mode,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getUserStatusProvider';
}

/// See also [getUserStatus].
class GetUserStatusProvider
    extends AutoDisposeFutureProvider<List<UserTableData>> {
  /// See also [getUserStatus].
  GetUserStatusProvider(
    DateTime time,
    SynchronizeMode mode,
  ) : this._internal(
          (ref) => getUserStatus(
            ref as GetUserStatusRef,
            time,
            mode,
          ),
          from: getUserStatusProvider,
          name: r'getUserStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getUserStatusHash,
          dependencies: GetUserStatusFamily._dependencies,
          allTransitiveDependencies:
              GetUserStatusFamily._allTransitiveDependencies,
          time: time,
          mode: mode,
        );

  GetUserStatusProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.time,
    required this.mode,
  }) : super.internal();

  final DateTime time;
  final SynchronizeMode mode;

  @override
  Override overrideWith(
    FutureOr<List<UserTableData>> Function(GetUserStatusRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetUserStatusProvider._internal(
        (ref) => create(ref as GetUserStatusRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        time: time,
        mode: mode,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<UserTableData>> createElement() {
    return _GetUserStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetUserStatusProvider &&
        other.time == time &&
        other.mode == mode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, time.hashCode);
    hash = _SystemHash.combine(hash, mode.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetUserStatusRef on AutoDisposeFutureProviderRef<List<UserTableData>> {
  /// The parameter `time` of this provider.
  DateTime get time;

  /// The parameter `mode` of this provider.
  SynchronizeMode get mode;
}

class _GetUserStatusProviderElement
    extends AutoDisposeFutureProviderElement<List<UserTableData>>
    with GetUserStatusRef {
  _GetUserStatusProviderElement(super.provider);

  @override
  DateTime get time => (origin as GetUserStatusProvider).time;
  @override
  SynchronizeMode get mode => (origin as GetUserStatusProvider).mode;
}

String _$getUserDiffHash() => r'4dfbc808fad8a84fdd8d75d4005e9a28dea6ba88';

/// See also [getUserDiff].
@ProviderFor(getUserDiff)
const getUserDiffProvider = GetUserDiffFamily();

/// See also [getUserDiff].
class GetUserDiffFamily extends Family<AsyncValue<List<UserTableData>>> {
  /// See also [getUserDiff].
  const GetUserDiffFamily();

  /// See also [getUserDiff].
  GetUserDiffProvider call(
    SynchronizeMode leftOperand,
    SynchronizeMode rightOperand,
    DateTime leftTime,
    DateTime rightTime,
    OperatorType operator,
    SortType sortType,
    SortBy sortBy,
  ) {
    return GetUserDiffProvider(
      leftOperand,
      rightOperand,
      leftTime,
      rightTime,
      operator,
      sortType,
      sortBy,
    );
  }

  @override
  GetUserDiffProvider getProviderOverride(
    covariant GetUserDiffProvider provider,
  ) {
    return call(
      provider.leftOperand,
      provider.rightOperand,
      provider.leftTime,
      provider.rightTime,
      provider.operator,
      provider.sortType,
      provider.sortBy,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getUserDiffProvider';
}

/// See also [getUserDiff].
class GetUserDiffProvider
    extends AutoDisposeFutureProvider<List<UserTableData>> {
  /// See also [getUserDiff].
  GetUserDiffProvider(
    SynchronizeMode leftOperand,
    SynchronizeMode rightOperand,
    DateTime leftTime,
    DateTime rightTime,
    OperatorType operator,
    SortType sortType,
    SortBy sortBy,
  ) : this._internal(
          (ref) => getUserDiff(
            ref as GetUserDiffRef,
            leftOperand,
            rightOperand,
            leftTime,
            rightTime,
            operator,
            sortType,
            sortBy,
          ),
          from: getUserDiffProvider,
          name: r'getUserDiffProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getUserDiffHash,
          dependencies: GetUserDiffFamily._dependencies,
          allTransitiveDependencies:
              GetUserDiffFamily._allTransitiveDependencies,
          leftOperand: leftOperand,
          rightOperand: rightOperand,
          leftTime: leftTime,
          rightTime: rightTime,
          operator: operator,
          sortType: sortType,
          sortBy: sortBy,
        );

  GetUserDiffProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.leftOperand,
    required this.rightOperand,
    required this.leftTime,
    required this.rightTime,
    required this.operator,
    required this.sortType,
    required this.sortBy,
  }) : super.internal();

  final SynchronizeMode leftOperand;
  final SynchronizeMode rightOperand;
  final DateTime leftTime;
  final DateTime rightTime;
  final OperatorType operator;
  final SortType sortType;
  final SortBy sortBy;

  @override
  Override overrideWith(
    FutureOr<List<UserTableData>> Function(GetUserDiffRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetUserDiffProvider._internal(
        (ref) => create(ref as GetUserDiffRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        leftOperand: leftOperand,
        rightOperand: rightOperand,
        leftTime: leftTime,
        rightTime: rightTime,
        operator: operator,
        sortType: sortType,
        sortBy: sortBy,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<UserTableData>> createElement() {
    return _GetUserDiffProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetUserDiffProvider &&
        other.leftOperand == leftOperand &&
        other.rightOperand == rightOperand &&
        other.leftTime == leftTime &&
        other.rightTime == rightTime &&
        other.operator == operator &&
        other.sortType == sortType &&
        other.sortBy == sortBy;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, leftOperand.hashCode);
    hash = _SystemHash.combine(hash, rightOperand.hashCode);
    hash = _SystemHash.combine(hash, leftTime.hashCode);
    hash = _SystemHash.combine(hash, rightTime.hashCode);
    hash = _SystemHash.combine(hash, operator.hashCode);
    hash = _SystemHash.combine(hash, sortType.hashCode);
    hash = _SystemHash.combine(hash, sortBy.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetUserDiffRef on AutoDisposeFutureProviderRef<List<UserTableData>> {
  /// The parameter `leftOperand` of this provider.
  SynchronizeMode get leftOperand;

  /// The parameter `rightOperand` of this provider.
  SynchronizeMode get rightOperand;

  /// The parameter `leftTime` of this provider.
  DateTime get leftTime;

  /// The parameter `rightTime` of this provider.
  DateTime get rightTime;

  /// The parameter `operator` of this provider.
  OperatorType get operator;

  /// The parameter `sortType` of this provider.
  SortType get sortType;

  /// The parameter `sortBy` of this provider.
  SortBy get sortBy;
}

class _GetUserDiffProviderElement
    extends AutoDisposeFutureProviderElement<List<UserTableData>>
    with GetUserDiffRef {
  _GetUserDiffProviderElement(super.provider);

  @override
  SynchronizeMode get leftOperand =>
      (origin as GetUserDiffProvider).leftOperand;
  @override
  SynchronizeMode get rightOperand =>
      (origin as GetUserDiffProvider).rightOperand;
  @override
  DateTime get leftTime => (origin as GetUserDiffProvider).leftTime;
  @override
  DateTime get rightTime => (origin as GetUserDiffProvider).rightTime;
  @override
  OperatorType get operator => (origin as GetUserDiffProvider).operator;
  @override
  SortType get sortType => (origin as GetUserDiffProvider).sortType;
  @override
  SortBy get sortBy => (origin as GetUserDiffProvider).sortBy;
}

String _$getUserStateHash() => r'ceb4becf640683e742071c19a89ab2a4dbb4bd08';

/// See also [getUserState].
@ProviderFor(getUserState)
const getUserStateProvider = GetUserStateFamily();

/// See also [getUserState].
class GetUserStateFamily extends Family<AsyncValue<UserTableData>> {
  /// See also [getUserState].
  const GetUserStateFamily();

  /// See also [getUserState].
  GetUserStateProvider call(
    String userId,
  ) {
    return GetUserStateProvider(
      userId,
    );
  }

  @override
  GetUserStateProvider getProviderOverride(
    covariant GetUserStateProvider provider,
  ) {
    return call(
      provider.userId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getUserStateProvider';
}

/// See also [getUserState].
class GetUserStateProvider extends AutoDisposeFutureProvider<UserTableData> {
  /// See also [getUserState].
  GetUserStateProvider(
    String userId,
  ) : this._internal(
          (ref) => getUserState(
            ref as GetUserStateRef,
            userId,
          ),
          from: getUserStateProvider,
          name: r'getUserStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getUserStateHash,
          dependencies: GetUserStateFamily._dependencies,
          allTransitiveDependencies:
              GetUserStateFamily._allTransitiveDependencies,
          userId: userId,
        );

  GetUserStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  Override overrideWith(
    FutureOr<UserTableData> Function(GetUserStateRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetUserStateProvider._internal(
        (ref) => create(ref as GetUserStateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<UserTableData> createElement() {
    return _GetUserStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetUserStateProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetUserStateRef on AutoDisposeFutureProviderRef<UserTableData> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _GetUserStateProviderElement
    extends AutoDisposeFutureProviderElement<UserTableData>
    with GetUserStateRef {
  _GetUserStateProviderElement(super.provider);

  @override
  String get userId => (origin as GetUserStateProvider).userId;
}

String _$userStateHash() => r'3950fff37f99c2b4ae835c71fb85d03bef320929';

abstract class _$UserState extends BuildlessNotifier<UserTableData?> {
  late final String userId;

  UserTableData? build(
    String userId,
  );
}

/// See also [UserState].
@ProviderFor(UserState)
const userStateProvider = UserStateFamily();

/// See also [UserState].
class UserStateFamily extends Family<UserTableData?> {
  /// See also [UserState].
  const UserStateFamily();

  /// See also [UserState].
  UserStateProvider call(
    String userId,
  ) {
    return UserStateProvider(
      userId,
    );
  }

  @override
  UserStateProvider getProviderOverride(
    covariant UserStateProvider provider,
  ) {
    return call(
      provider.userId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'userStateProvider';
}

/// See also [UserState].
class UserStateProvider
    extends NotifierProviderImpl<UserState, UserTableData?> {
  /// See also [UserState].
  UserStateProvider(
    String userId,
  ) : this._internal(
          () => UserState()..userId = userId,
          from: userStateProvider,
          name: r'userStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userStateHash,
          dependencies: UserStateFamily._dependencies,
          allTransitiveDependencies: UserStateFamily._allTransitiveDependencies,
          userId: userId,
        );

  UserStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  UserTableData? runNotifierBuild(
    covariant UserState notifier,
  ) {
    return notifier.build(
      userId,
    );
  }

  @override
  Override overrideWith(UserState Function() create) {
    return ProviderOverride(
      origin: this,
      override: UserStateProvider._internal(
        () => create()..userId = userId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  NotifierProviderElement<UserState, UserTableData?> createElement() {
    return _UserStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserStateProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UserStateRef on NotifierProviderRef<UserTableData?> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _UserStateProviderElement
    extends NotifierProviderElement<UserState, UserTableData?>
    with UserStateRef {
  _UserStateProviderElement(super.provider);

  @override
  String get userId => (origin as UserStateProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
