// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accessibility.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$languageCodeHash() => r'4fc6e9007f0cc7fd2b8ac702fc321ffe42defd87';

/// See also [LanguageCode].
@ProviderFor(LanguageCode)
final languageCodeProvider =
    AutoDisposeNotifierProvider<LanguageCode, LanguageCodeEnum>.internal(
  LanguageCode.new,
  name: r'languageCodeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$languageCodeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LanguageCode = AutoDisposeNotifier<LanguageCodeEnum>;
String _$themeBrightnessHash() => r'723f59e66f16dc374a0fbae5af2a76131c38b972';

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

abstract class _$ThemeBrightness
    extends BuildlessAutoDisposeNotifier<ThemeBrightnessEnum> {
  late final bool dark;

  ThemeBrightnessEnum build(
    bool dark,
  );
}

/// See also [ThemeBrightness].
@ProviderFor(ThemeBrightness)
const themeBrightnessProvider = ThemeBrightnessFamily();

/// See also [ThemeBrightness].
class ThemeBrightnessFamily extends Family<ThemeBrightnessEnum> {
  /// See also [ThemeBrightness].
  const ThemeBrightnessFamily();

  /// See also [ThemeBrightness].
  ThemeBrightnessProvider call(
    bool dark,
  ) {
    return ThemeBrightnessProvider(
      dark,
    );
  }

  @override
  ThemeBrightnessProvider getProviderOverride(
    covariant ThemeBrightnessProvider provider,
  ) {
    return call(
      provider.dark,
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
  String? get name => r'themeBrightnessProvider';
}

/// See also [ThemeBrightness].
class ThemeBrightnessProvider extends AutoDisposeNotifierProviderImpl<
    ThemeBrightness, ThemeBrightnessEnum> {
  /// See also [ThemeBrightness].
  ThemeBrightnessProvider(
    this.dark,
  ) : super.internal(
          () => ThemeBrightness()..dark = dark,
          from: themeBrightnessProvider,
          name: r'themeBrightnessProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$themeBrightnessHash,
          dependencies: ThemeBrightnessFamily._dependencies,
          allTransitiveDependencies:
              ThemeBrightnessFamily._allTransitiveDependencies,
        );

  final bool dark;

  @override
  bool operator ==(Object other) {
    return other is ThemeBrightnessProvider && other.dark == dark;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, dark.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  ThemeBrightnessEnum runNotifierBuild(
    covariant ThemeBrightness notifier,
  ) {
    return notifier.build(
      dark,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
