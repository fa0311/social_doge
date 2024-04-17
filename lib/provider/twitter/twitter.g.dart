// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'twitter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getTwitterClientHash() => r'51b48f19855e8030b28769438bf0011764722265';

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
String _$getUserByScreenNameHash() =>
    r'f0bbb12a088c2c8a9b5e300bb378d2be6546a8c0';

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

/// See also [getUserByScreenName].
@ProviderFor(getUserByScreenName)
const getUserByScreenNameProvider = GetUserByScreenNameFamily();

/// See also [getUserByScreenName].
class GetUserByScreenNameFamily extends Family<AsyncValue<User>> {
  /// See also [getUserByScreenName].
  const GetUserByScreenNameFamily();

  /// See also [getUserByScreenName].
  GetUserByScreenNameProvider call(
    String twitterId,
  ) {
    return GetUserByScreenNameProvider(
      twitterId,
    );
  }

  @override
  GetUserByScreenNameProvider getProviderOverride(
    covariant GetUserByScreenNameProvider provider,
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
  String? get name => r'getUserByScreenNameProvider';
}

/// See also [getUserByScreenName].
class GetUserByScreenNameProvider extends FutureProvider<User> {
  /// See also [getUserByScreenName].
  GetUserByScreenNameProvider(
    String twitterId,
  ) : this._internal(
          (ref) => getUserByScreenName(
            ref as GetUserByScreenNameRef,
            twitterId,
          ),
          from: getUserByScreenNameProvider,
          name: r'getUserByScreenNameProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getUserByScreenNameHash,
          dependencies: GetUserByScreenNameFamily._dependencies,
          allTransitiveDependencies:
              GetUserByScreenNameFamily._allTransitiveDependencies,
          twitterId: twitterId,
        );

  GetUserByScreenNameProvider._internal(
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
    FutureOr<User> Function(GetUserByScreenNameRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetUserByScreenNameProvider._internal(
        (ref) => create(ref as GetUserByScreenNameRef),
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
    return _GetUserByScreenNameProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetUserByScreenNameProvider && other.twitterId == twitterId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, twitterId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetUserByScreenNameRef on FutureProviderRef<User> {
  /// The parameter `twitterId` of this provider.
  String get twitterId;
}

class _GetUserByScreenNameProviderElement extends FutureProviderElement<User>
    with GetUserByScreenNameRef {
  _GetUserByScreenNameProviderElement(super.provider);

  @override
  String get twitterId => (origin as GetUserByScreenNameProvider).twitterId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
