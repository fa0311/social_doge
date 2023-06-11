// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diff.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getFollowerTimeHash() => r'03ec042aa0338307c6b8ac027fc055887eac6c8f';

/// See also [getFollowerTime].
@ProviderFor(getFollowerTime)
final getFollowerTimeProvider = AutoDisposeFutureProvider<List<int>>.internal(
  getFollowerTime,
  name: r'getFollowerTimeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getFollowerTimeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetFollowerTimeRef = AutoDisposeFutureProviderRef<List<int>>;
String _$getUnsubscribeHash() => r'8b7b3b5cd42c0c44eb70ff07644485bb446accea';

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

typedef GetUnsubscribeRef = AutoDisposeFutureProviderRef<List<String>>;

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
    this.count,
  ) : super.internal(
          (ref) => getUnsubscribe(
            ref,
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
        );

  final int count;

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

String _$getUserHash() => r'cd46e27998a2de0bc8b80ce8c3cb0fdc2bc39f96';
typedef GetUserRef = AutoDisposeFutureProviderRef<UserDB>;

/// See also [getUser].
@ProviderFor(getUser)
const getUserProvider = GetUserFamily();

/// See also [getUser].
class GetUserFamily extends Family<AsyncValue<UserDB>> {
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
class GetUserProvider extends AutoDisposeFutureProvider<UserDB> {
  /// See also [getUser].
  GetUserProvider(
    this.id,
  ) : super.internal(
          (ref) => getUser(
            ref,
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
        );

  final String id;

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
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
