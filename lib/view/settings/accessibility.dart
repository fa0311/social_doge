import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_doge/component/modal.dart';
import 'package:social_doge/view/settings/true_black.dart';
part 'accessibility.g.dart';

class SettingsAccessibility extends ConsumerWidget {
  const SettingsAccessibility({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // AccessibilityConfigNotifier accessibilityConfig = ref.watch(accessibilityConfigProvider);

    final languageCode = ref.watch(languageCodeProvider);
    final themeBrightness = ref.watch(themeBrightnessProvider(false));
    final darkThemeBrightness = ref.watch(themeBrightnessProvider(true));

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.setting),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                ListTile(
                  title: Text(AppLocalizations.of(context)!.language),
                  subtitle: Text(languageCode.text),
                  onTap: () => showModalBottomSheetStatelessWidget<Widget>(context: context, builder: () => const LocaleModal()),
                ),
                ListTile(
                  title: Text(AppLocalizations.of(context)!.deviceLightTheme),
                  subtitle: Text(themeBrightness.toLocalization(context)),
                  onTap: () => showModalBottomSheetStatelessWidget<Widget>(context: context, builder: () => const ThemeBrightnessModal(dark: false)),
                ),
                ListTile(
                  title: Text(AppLocalizations.of(context)!.deviceDarkTheme),
                  subtitle: Text(darkThemeBrightness.toLocalization(context)),
                  onTap: () => showModalBottomSheetStatelessWidget<Widget>(context: context, builder: () => const ThemeBrightnessModal(dark: true)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum LanguageCodeEnum {
  en('English'),
  ja('日本語');

  const LanguageCodeEnum(this.text);

  final String text;
}

@Riverpod(keepAlive: true)
class LanguageCode extends _$LanguageCode {
  static String key = 'language_code';
  @override
  LanguageCodeEnum build() => LanguageCodeEnum.ja;
  Future<void> update(LanguageCodeEnum method) async {
    state = method;
    final pref = await SharedPreferences.getInstance();
    await pref.setString(key, method.name);
  }

  Future<void> get() async {
    final pref = await SharedPreferences.getInstance();
    if (pref.getString(key) != null) {
      state = LanguageCodeEnum.values.byName(pref.getString(key)!);
    }
  }
}

class LocaleModal extends ConsumerWidget {
  const LocaleModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageCode = ref.watch(languageCodeProvider);

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          for (LanguageCodeEnum value in LanguageCodeEnum.values)
            ListTile(
              title: Text(value.text),
              trailing: languageCode == value ? const Icon(Icons.check) : null,
              subtitle: Text(AppLocalizations.of(context)!.translatorDetails(lookupAppLocalizations(Locale(value.name, '')).contributor)),
              onTap: () {
                ref.read(languageCodeProvider.notifier).update(value);
              },
            ),
        ],
      ),
    );
  }
}

enum ThemeBrightnessEnum {
  light,
  dark,
  black,
  trueBlack,
  highContrastLight,
  highContrastDark;

  String toLocalization(BuildContext context) {
    switch (this) {
      case ThemeBrightnessEnum.light:
        return AppLocalizations.of(context)!.lightTheme;
      case ThemeBrightnessEnum.dark:
        return AppLocalizations.of(context)!.darkTheme;
      case ThemeBrightnessEnum.black:
        return AppLocalizations.of(context)!.blackTheme;
      case ThemeBrightnessEnum.trueBlack:
        return AppLocalizations.of(context)!.trueBlackTheme;
      case ThemeBrightnessEnum.highContrastLight:
        return AppLocalizations.of(context)!.highContrastLightTheme;
      case ThemeBrightnessEnum.highContrastDark:
        return AppLocalizations.of(context)!.highContrastDarkTheme;
    }
  }

  ThemeData toTheme() {
    switch (this) {
      case ThemeBrightnessEnum.light:
        return ThemeData(brightness: Brightness.light);
      case ThemeBrightnessEnum.dark:
        return ThemeData(brightness: Brightness.dark, primarySwatch: Colors.grey);
      case ThemeBrightnessEnum.black:
        return blackTheme();
      case ThemeBrightnessEnum.trueBlack:
        return trueBlackTheme();
      case ThemeBrightnessEnum.highContrastLight:
        return highContrastLightTheme();
      case ThemeBrightnessEnum.highContrastDark:
        return highContrastDarkTheme();
    }
  }
}

@Riverpod(keepAlive: true)
class ThemeBrightness extends _$ThemeBrightness {
  static String key = 'theme_brightness';

  @override
  ThemeBrightnessEnum build(bool dark) => ThemeBrightnessEnum.light;
  Future<void> update(ThemeBrightnessEnum method) async {
    state = method;
    final pref = await SharedPreferences.getInstance();
    await pref.setString(key, method.name);
  }

  Future<void> get() async {
    final pref = await SharedPreferences.getInstance();
    if (pref.getString(key) != null) {
      state = ThemeBrightnessEnum.values.byName(pref.getString(key)!);
    }
  }
}

class ThemeBrightnessModal extends ConsumerWidget {
  const ThemeBrightnessModal({super.key, required this.dark});
  final bool dark;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeBrightness = ref.watch(themeBrightnessProvider(dark));

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          for (final value in ThemeBrightnessEnum.values)
            ListTile(
              title: Text(value.toLocalization(context)),
              trailing: themeBrightness == value ? const Icon(Icons.check) : null,
              onTap: () => ref.read(themeBrightnessProvider(dark).notifier).update(value),
            ),
        ],
      ),
    );
  }
}
