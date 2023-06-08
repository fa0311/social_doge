// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:social_doge/component/modal.dart';

part 'accessibility.g.dart';

class SettingsAccessibility extends ConsumerWidget {
  const SettingsAccessibility({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // AccessibilityConfigNotifier accessibilityConfig = ref.watch(accessibilityConfigProvider);

    final languageCode = ref.watch(languageCodeProvider);
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
                  onTap: () => showModalBottomSheetStatelessWidget(
                    context: context,
                    builder: () => const LocaleModal(),
                  ),
                ),
                /*
                ListTile(
                  title: Text(AppLocalizations.of(context)!.deviceLightTheme),
                  subtitle: Text(accessibilityConfig.themeBrightness.toLocalization(context)),
                  onTap: () => showModalBottomSheetStatelessWidget(
                    context: context,
                    builder: () => const ThemeBrightnessModal(dark: false),
                  ),
                ),
                ListTile(
                  title: Text(AppLocalizations.of(context)!.deviceDarkTheme),
                  subtitle: Text(accessibilityConfig.darkThemeBrightness.toLocalization(context)),
                  onTap: () => showModalBottomSheetStatelessWidget(
                    context: context,
                    builder: () => const ThemeBrightnessModal(dark: true),
                  ),
                ),
                */
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum LanguageCodeEnum {
  en("English"),
  ja("日本語");

  final String text;
  const LanguageCodeEnum(this.text);
}

@riverpod
class LanguageCode extends _$LanguageCode {
  @override
  LanguageCodeEnum build() => LanguageCodeEnum.ja;
  Future<void> update(LanguageCodeEnum method) async {
    state = method;
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('language_code', method.name);
  }
}

class LocaleModal extends ConsumerWidget {
  const LocaleModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageCodeConfig = ref.watch(languageCodeProvider);

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          for (LanguageCodeEnum value in LanguageCodeEnum.values)
            ListTile(
              title: Text(value.text),
              trailing: languageCodeConfig == value ? const Icon(Icons.check) : null,
              subtitle: Text(
                AppLocalizations.of(context)!.translatorDetails(
                  lookupAppLocalizations(Locale(value.name, "")).contributor,
                ),
              ),
              onTap: () {
                ref.read(languageCodeProvider.notifier).update(value);
              },
            ),
        ],
      ),
    );
  }
}
