// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'twitter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getTwitterClientHash() => r'cd486b3e08866aeb0562ac16e53528e1ae3acfc8';

/// See also [getTwitterClient].
@ProviderFor(getTwitterClient)
final getTwitterClientProvider =
    FutureProvider<TwitterOpenapiDartClient>.internal(
  getTwitterClient,
  name: r'getTwitterClientProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getTwitterClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetTwitterClientRef = FutureProviderRef<TwitterOpenapiDartClient>;
String _$twitterUserHash() => r'2330ba228519c3cfe64e7eff736c394994822573';

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

typedef TwitterUserRef = FutureProviderRef<User>;

/// See also [twitterUser].
@ProviderFor(twitterUser)
const twitterUserProvider = TwitterUserFamily();

/// See also [twitterUser].
class TwitterUserFamily extends Family<AsyncValue<User>> {
  /// See also [twitterUser].
  const TwitterUserFamily();

  /// See also [twitterUser].
  TwitterUserProvider call(
    String twitterId,
  ) {
    return TwitterUserProvider(
      twitterId,
    );
  }

  @override
  TwitterUserProvider getProviderOverride(
    covariant TwitterUserProvider provider,
  ) {
    return call(
      provider.twitterId,
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
  String? get name => r'twitterUserProvider';
}

/// See also [twitterUser].
class TwitterUserProvider extends FutureProvider<User> {
  /// See also [twitterUser].
  TwitterUserProvider(
    this.twitterId,
  ) : super.internal(
          (ref) => twitterUser(
            ref,
            twitterId,
          ),
          from: twitterUserProvider,
          name: r'twitterUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$twitterUserHash,
          dependencies: TwitterUserFamily._dependencies,
          allTransitiveDependencies:
              TwitterUserFamily._allTransitiveDependencies,
        );

  final String twitterId;

  @override
  bool operator ==(Object other) {
    return other is TwitterUserProvider && other.twitterId == twitterId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, twitterId.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
