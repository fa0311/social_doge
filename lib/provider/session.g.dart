// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$socialDogeAPIHash() => r'c906f37929765569c1423d0cc97685248f8834c0';

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

typedef SocialDogeAPIRef = AutoDisposeProviderRef<SocialDogeAPI>;

/// See also [socialDogeAPI].
@ProviderFor(socialDogeAPI)
const socialDogeAPIProvider = SocialDogeAPIFamily();

/// See also [socialDogeAPI].
class SocialDogeAPIFamily extends Family<SocialDogeAPI> {
  /// See also [socialDogeAPI].
  const SocialDogeAPIFamily();

  /// See also [socialDogeAPI].
  SocialDogeAPIProvider call({
    required String path,
  }) {
    return SocialDogeAPIProvider(
      path: path,
    );
  }

  @override
  SocialDogeAPIProvider getProviderOverride(
    covariant SocialDogeAPIProvider provider,
  ) {
    return call(
      path: provider.path,
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
  String? get name => r'socialDogeAPIProvider';
}

/// See also [socialDogeAPI].
class SocialDogeAPIProvider extends AutoDisposeProvider<SocialDogeAPI> {
  /// See also [socialDogeAPI].
  SocialDogeAPIProvider({
    required this.path,
  }) : super.internal(
          (ref) => socialDogeAPI(
            ref,
            path: path,
          ),
          from: socialDogeAPIProvider,
          name: r'socialDogeAPIProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$socialDogeAPIHash,
          dependencies: SocialDogeAPIFamily._dependencies,
          allTransitiveDependencies:
              SocialDogeAPIFamily._allTransitiveDependencies,
        );

  final String path;

  @override
  bool operator ==(Object other) {
    return other is SocialDogeAPIProvider && other.path == path;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, path.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$loginSessionHash() => r'5f294d5b117b07ec4111a2ede26a93f556a753fa';

/// See also [loginSession].
@ProviderFor(loginSession)
final loginSessionProvider = AutoDisposeFutureProvider<SocialDogeAPI>.internal(
  loginSession,
  name: r'loginSessionProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$loginSessionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LoginSessionRef = AutoDisposeFutureProviderRef<SocialDogeAPI>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
