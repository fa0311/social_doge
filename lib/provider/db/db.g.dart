// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getFollowerTimeHash() => r'945371df3ab35e401af4a2cc0be4af4b613fc155';

/// See also [getFollowerTime].
@ProviderFor(getFollowerTime)
final getFollowerTimeProvider =
    AutoDisposeFutureProvider<List<DateTime>>.internal(
  getFollowerTime,
  name: r'getFollowerTimeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getFollowerTimeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetFollowerTimeRef = AutoDisposeFutureProviderRef<List<DateTime>>;
String _$getUnsubscribeHash() => r'7c32fe26bd6c6393fa8d34717d8c18cf4f753a3c';

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

/// See also [getUnsubscribe].
@ProviderFor(getUnsubscribe)
const getUnsubscribeProvider = GetUnsubscribeFamily();

/// See also [getUnsubscribe].
class GetUnsubscribeFamily extends Family<AsyncValue<List<String>>> {
  /// See also [getUnsubscribe].
  const GetUnsubscribeFamily();

  /// See also [getUnsubscribe].
  GetUnsubscribeProvider call(
    int count,
  ) {
    return GetUnsubscribeProvider(
      count,
    );
  }

  @override
  GetUnsubscribeProvider getProviderOverride(
    covariant GetUnsubscribeProvider provider,
  ) {
    return call(
      provider.count,
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
  String? get name => r'getUnsubscribeProvider';
}

/// See also [getUnsubscribe].
class GetUnsubscribeProvider extends AutoDisposeFutureProvider<List<String>> {
  /// See also [getUnsubscribe].
  GetUnsubscribeProvider(
    int count,
  ) : this._internal(
          (ref) => getUnsubscribe(
            ref as GetUnsubscribeRef,
            count,
          ),
          from: getUnsubscribeProvider,
          name: r'getUnsubscribeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getUnsubscribeHash,
          dependencies: GetUnsubscribeFamily._dependencies,
          allTransitiveDependencies:
              GetUnsubscribeFamily._allTransitiveDependencies,
          count: count,
        );

  GetUnsubscribeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.count,
  }) : super.internal();

  final int count;

  @override
  Override overrideWith(
    FutureOr<List<String>> Function(GetUnsubscribeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetUnsubscribeProvider._internal(
        (ref) => create(ref as GetUnsubscribeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        count: count,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<String>> createElement() {
    return _GetUnsubscribeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetUnsubscribeProvider && other.count == count;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, count.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetUnsubscribeRef on AutoDisposeFutureProviderRef<List<String>> {
  /// The parameter `count` of this provider.
  int get count;
}

class _GetUnsubscribeProviderElement
    extends AutoDisposeFutureProviderElement<List<String>>
    with GetUnsubscribeRef {
  _GetUnsubscribeProviderElement(super.provider);

  @override
  int get count => (origin as GetUnsubscribeProvider).count;
}

String _$getUserHash() => r'420213d1b54c811f48f4961317cd70cc09e12f19';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
