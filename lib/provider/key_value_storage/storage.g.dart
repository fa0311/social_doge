// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getSharedPreferencesHash() =>
    r'7ce8e20683e3fac7696b33cef4254ae2fcb5b634';

/// See also [getSharedPreferences].
@ProviderFor(getSharedPreferences)
final getSharedPreferencesProvider = FutureProvider<KeyValueStorage>.internal(
  getSharedPreferences,
  name: r'getSharedPreferencesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getSharedPreferencesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetSharedPreferencesRef = FutureProviderRef<KeyValueStorage>;
String _$themeSettingHash() => r'c49c3a3bc228ae1595f9f241a270f3d18165827f';

/// See also [ThemeSetting].
@ProviderFor(ThemeSetting)
final themeSettingProvider =
    AsyncNotifierProvider<ThemeSetting, ThemeMode>.internal(
  ThemeSetting.new,
  name: r'themeSettingProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$themeSettingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ThemeSetting = AsyncNotifier<ThemeMode>;
String _$languageSettingHash() => r'd2302fe28e8da3584864f9c48870799e1433016c';

/// See also [LanguageSetting].
@ProviderFor(LanguageSetting)
final languageSettingProvider =
    AsyncNotifierProvider<LanguageSetting, AppLocale>.internal(
  LanguageSetting.new,
  name: r'languageSettingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$languageSettingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LanguageSetting = AsyncNotifier<AppLocale>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
