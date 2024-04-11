// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getSharedPreferencesHash() =>
    r'7ce8e20683e3fac7696b33cef4254ae2fcb5b634';

/// キーバリューストレージを取得する
///
/// Copied from [getSharedPreferences].
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

/// キーバリューストレージからテーマを取得する
///
/// Copied from [ThemeSetting].
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
String _$languageSettingHash() => r'be208a52eb6624c9eb9e868573eb745be9aeb356';

/// キーバリューストレージから言語を取得する
/// 2つのキーから一つのロケールを取得する
///
/// Copied from [LanguageSetting].
@ProviderFor(LanguageSetting)
final languageSettingProvider =
    AsyncNotifierProvider<LanguageSetting, Locale>.internal(
  LanguageSetting.new,
  name: r'languageSettingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$languageSettingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LanguageSetting = AsyncNotifier<Locale>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
