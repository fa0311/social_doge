// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accessibility.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$languageCodeHash() => r'01f339f9d3a0e421e47ff8cfe260a60ef399f75d';

/// See also [LanguageCode].
@ProviderFor(LanguageCode)
final languageCodeProvider =
    NotifierProvider<LanguageCode, LanguageCodeEnum>.internal(
  LanguageCode.new,
  name: r'languageCodeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$languageCodeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LanguageCode = Notifier<LanguageCodeEnum>;
String _$themeBrightnessHash() => r'0d9d98b23bba453ca6c6cf7897fecf357613cf7f';

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
    extends BuildlessNotifier<ThemeBrightnessEnum> {
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
class ThemeBrightnessProvider
    extends NotifierProviderImpl<ThemeBrightness, ThemeBrightnessEnum> {
  /// See also [ThemeBrightness].
  ThemeBrightnessProvider(
    bool dark,
  ) : this._internal(
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
          dark: dark,
        );

  ThemeBrightnessProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.dark,
  }) : super.internal();

  final bool dark;

  @override
  ThemeBrightnessEnum runNotifierBuild(
    covariant ThemeBrightness notifier,
  ) {
    return notifier.build(
      dark,
    );
  }

  @override
  Override overrideWith(ThemeBrightness Function() create) {
    return ProviderOverride(
      origin: this,
      override: ThemeBrightnessProvider._internal(
        () => create()..dark = dark,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        dark: dark,
      ),
    );
  }

  @override
  NotifierProviderElement<ThemeBrightness, ThemeBrightnessEnum>
      createElement() {
    return _ThemeBrightnessProviderElement(this);
  }

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
}

mixin ThemeBrightnessRef on NotifierProviderRef<ThemeBrightnessEnum> {
  /// The parameter `dark` of this provider.
  bool get dark;
}

class _ThemeBrightnessProviderElement
    extends NotifierProviderElement<ThemeBrightness, ThemeBrightnessEnum>
    with ThemeBrightnessRef {
  _ThemeBrightnessProviderElement(super.provider);

  @override
  bool get dark => (origin as ThemeBrightnessProvider).dark;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
