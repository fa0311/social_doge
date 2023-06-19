// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unfollowed_user.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getFollowerTimeHash() => r'65920762e60e5f09a9b927828782799f70620aa4';

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
String _$getUnsubscribeHash() => r'5f32650c5b5ea8bb34633cfe29a4dd0762f05be6';

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
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
