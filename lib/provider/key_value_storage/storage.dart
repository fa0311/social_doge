import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_doge/infrastructure/key_value_storage/key_value_storage.dart';
import 'package:social_doge/infrastructure/key_value_storage/shared_preferences.dart';
import 'package:social_doge/util/enum.dart';

part 'storage.g.dart';

/// キーバリューストレージを取得する
@Riverpod(keepAlive: true)
Future<KeyValueStorage> getSharedPreferences(GetSharedPreferencesRef ref) async {
  return SharedKeyValue(await SharedPreferences.getInstance());
}

/// キーバリューストレージからテーマを取得する
@Riverpod(keepAlive: true)
class ThemeSetting extends _$ThemeSetting {
  /// テーマのキー
  static const key = 'theme';

  @override
  FutureOr<ThemeMode> build() async {
    final client = await ref.read(getSharedPreferencesProvider.future);
    final theme = await client.getString(key);
    return ThemeMode.values.byNameOrNull(theme) ?? ThemeMode.system;
  }

  Future<void> set(ThemeMode value) async {
    state = AsyncValue.data(value);
    final client = await ref.read(getSharedPreferencesProvider.future);
    await client.setString(key, value.name);
  }
}

/// キーバリューストレージから言語を取得する
/// 2つのキーから一つのロケールを取得する
@Riverpod(keepAlive: true)
class LanguageSetting extends _$LanguageSetting {
  /// 国のコードのキー
  static const countyCodeKey = 'countryCode';

  /// 言語のコードのキー
  static const languageCodeKey = 'language';

  @override
  FutureOr<Locale> build() async {
    final client = await ref.read(getSharedPreferencesProvider.future);
    final languageCode = await client.getString(languageCodeKey);
    final countryCode = await client.getString(countyCodeKey);
    return countryCode == null && countryCode == null ? defaultLocale() : Locale(languageCode!, countryCode);
  }

  /// 端末の設定に合わせたデフォルトの言語を返す
  Locale defaultLocale() {
    final locale = WidgetsBinding.instance.platformDispatcher.locale;
    return nearestLocale(locale) ?? nearestLocale(const Locale('en', 'US'))!;
  }

  /// 一番近い言語を返す
  Locale? nearestLocale(Locale locale) {
    // 言語と地域が一致するものがあればそれを返す
    for (final language in AppLocalizations.supportedLocales) {
      if (language.languageCode == locale.languageCode && language.countryCode == locale.countryCode) {
        return language;
      }
    }
    // 言語が一致するものがあればそれを返す
    for (final language in AppLocalizations.supportedLocales) {
      if (language.languageCode == locale.languageCode) {
        return language;
      }
    }
    return null;
  }

  Future<void> set(Locale value) async {
    state = AsyncValue.data(value);
    final client = await ref.read(getSharedPreferencesProvider.future);
    await client.setString(languageCodeKey, value.languageCode);
    await client.setString(countyCodeKey, value.countryCode ?? '');
  }
}
