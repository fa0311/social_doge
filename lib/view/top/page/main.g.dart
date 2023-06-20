// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getFollowersCountHash() => r'47f7e3c509d14c2b11be2497b4c26026e81054ad';

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
    Duration duration,
  ) {
    return GetFollowersCountProvider(
      duration,
    );
  }

  @override
  GetFollowersCountProvider getProviderOverride(
    covariant GetFollowersCountProvider provider,
  ) {
    return call(
      provider.duration,
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
    this.duration,
  ) : super.internal(
          (ref) => getFollowersCount(
            ref,
            duration,
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

  final Duration duration;

  @override
  bool operator ==(Object other) {
    return other is GetFollowersCountProvider && other.duration == duration;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, duration.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$removeLastSynchronizedHash() =>
    r'b06977556eed9c5b1d5e849f6ebd02cb49d5edc7';

/// See also [removeLastSynchronized].
@ProviderFor(removeLastSynchronized)
final removeLastSynchronizedProvider = AutoDisposeFutureProvider<void>.internal(
  removeLastSynchronized,
  name: r'removeLastSynchronizedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$removeLastSynchronizedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RemoveLastSynchronizedRef = AutoDisposeFutureProviderRef<void>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
