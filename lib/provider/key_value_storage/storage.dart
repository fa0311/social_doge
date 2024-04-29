import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_doge/i18n/translations.g.dart';
import 'package:social_doge/infrastructure/key_value_storage/key_value_storage.dart';
import 'package:social_doge/infrastructure/key_value_storage/shared_preferences.dart';
import 'package:social_doge/util/enum.dart';

part 'storage.g.dart';

@Riverpod(keepAlive: true)
Future<KeyValueStorage> getSharedPreferences(GetSharedPreferencesRef ref) async {
  return SharedKeyValue(await SharedPreferences.getInstance());
}

@Riverpod(keepAlive: true)
class ThemeSetting extends _$ThemeSetting {
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

@Riverpod(keepAlive: true)
class LanguageSetting extends _$LanguageSetting {
  static const countyCodeKey = 'countryCode';
  static const languageCodeKey = 'language';

  @override
  FutureOr<AppLocale> build() async {
    final client = await ref.read(getSharedPreferencesProvider.future);
    final languageCode = await client.getString(languageCodeKey);
    final countryCode = await client.getString(countyCodeKey);
    if (countryCode == null && countryCode == null) {
      return AppLocaleUtils.findDeviceLocale();
    } else {
      return AppLocaleUtils.parseLocaleParts(languageCode: languageCode!, countryCode: countryCode);
    }
  }

  Locale toLocale() {
    final data = state.valueOrNull ?? AppLocaleUtils.findDeviceLocale();
    return Locale(data.languageCode, data.countryCode);
  }

  Future<void> set(AppLocale value) async {
    state = AsyncValue.data(value);
    final client = await ref.read(getSharedPreferencesProvider.future);
    await client.setString(languageCodeKey, value.languageCode);
    await client.setString(countyCodeKey, value.countryCode ?? '');
  }
}
