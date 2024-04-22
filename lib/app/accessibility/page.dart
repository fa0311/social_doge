import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_doge/component/part/select_modal.dart';
import 'package:social_doge/provider/key_value_storage/storage.dart';

extension on ThemeMode {
  String localizations(AppLocalizations localizations) {
    return switch (this) {
      ThemeMode.system => localizations.system,
      ThemeMode.light => localizations.lightTheme,
      ThemeMode.dark => localizations.darkTheme,
    };
  }
}

@RoutePage()
class AccessibilityPage extends HookConsumerWidget {
  const AccessibilityPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.accessibility),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(AppLocalizations.of(context)!.language),
            onTap: () {
              SelectModalTile.consumer(
                context,
                itemCount: AppLocalizations.supportedLocales.length,
                builder: (context, index, ref) {
                  final data = AppLocalizations.supportedLocales[index];
                  return ListTile(
                    title: Text(lookupAppLocalizations(data).language),
                    selected: ref.watch(languageSettingProvider).valueOrNull == data,
                    onTap: () {
                      ref.read(languageSettingProvider.notifier).set(data);
                    },
                  );
                },
              );
            },
          ),
          ListTile(
            title: const Text('AppLocalizations.of(context)!.theme'),
            onTap: () {
              SelectModalTile.consumer(
                context,
                itemCount: ThemeMode.values.length,
                builder: (context, index, ref) {
                  final data = ThemeMode.values[index];
                  return ListTile(
                    title: Text(data.localizations(AppLocalizations.of(context)!)),
                    selected: ref.watch(themeSettingProvider).valueOrNull == data,
                    onTap: () {
                      ref.read(themeSettingProvider.notifier).set(data);
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
