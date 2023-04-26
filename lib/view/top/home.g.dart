// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getFollowersCountHash() => r'db66f4d64b5753c1504ee56717f0c98194b2273d';

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

typedef GetFollowersCountRef
    = AutoDisposeFutureProviderRef<List<FollowersCount>>;

/// See also [getFollowersCount].
@ProviderFor(getFollowersCount)
const getFollowersCountProvider = GetFollowersCountFamily();

/// See also [getFollowersCount].
class GetFollowersCountFamily extends Family<AsyncValue<List<FollowersCount>>> {
  /// See also [getFollowersCount].
  const GetFollowersCountFamily();

  /// See also [getFollowersCount].
  GetFollowersCountProvider call(
    int? time,
  ) {
    return GetFollowersCountProvider(
      time,
    );
  }

  @override
  GetFollowersCountProvider getProviderOverride(
    covariant GetFollowersCountProvider provider,
  ) {
    return call(
      provider.time,
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
  String? get name => r'getFollowersCountProvider';
}

/// See also [getFollowersCount].
class GetFollowersCountProvider
    extends AutoDisposeFutureProvider<List<FollowersCount>> {
  /// See also [getFollowersCount].
  GetFollowersCountProvider(
    this.time,
  ) : super.internal(
          (ref) => getFollowersCount(
            ref,
            time,
          ),
          from: getFollowersCountProvider,
          name: r'getFollowersCountProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getFollowersCountHash,
          dependencies: GetFollowersCountFamily._dependencies,
          allTransitiveDependencies:
              GetFollowersCountFamily._allTransitiveDependencies,
        );

  final int? time;

  @override
  bool operator ==(Object other) {
    return other is GetFollowersCountProvider && other.time == time;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, time.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$currentIndexHash() => r'089bd949dd4a4c3ed85e39ae8bc7e7ff0f31aa81';

/// See also [CurrentIndex].
@ProviderFor(CurrentIndex)
final currentIndexProvider =
    AutoDisposeNotifierProvider<CurrentIndex, CurrentIndexEnum>.internal(
  CurrentIndex.new,
  name: r'currentIndexProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentIndexHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentIndex = AutoDisposeNotifier<CurrentIndexEnum>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
