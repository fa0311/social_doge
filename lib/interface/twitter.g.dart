// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'twitter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getTwitterClientHash() => r'c3497236322619f8a177244960e048270df72577';

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
    String twitterId,
  ) : this._internal(
          (ref) => twitterUser(
            ref as TwitterUserRef,
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
          twitterId: twitterId,
        );

  TwitterUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.twitterId,
  }) : super.internal();

  final String twitterId;

  @override
  Override overrideWith(
    FutureOr<User> Function(TwitterUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TwitterUserProvider._internal(
        (ref) => create(ref as TwitterUserRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        twitterId: twitterId,
      ),
    );
  }

  @override
  FutureProviderElement<User> createElement() {
    return _TwitterUserProviderElement(this);
  }

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

mixin TwitterUserRef on FutureProviderRef<User> {
  /// The parameter `twitterId` of this provider.
  String get twitterId;
}

class _TwitterUserProviderElement extends FutureProviderElement<User>
    with TwitterUserRef {
  _TwitterUserProviderElement(super.provider);

  @override
  String get twitterId => (origin as TwitterUserProvider).twitterId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
