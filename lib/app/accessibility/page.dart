import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_doge/component/part/select_modal.dart';
import 'package:social_doge/i18n/translations.g.dart';
import 'package:social_doge/provider/key_value_storage/storage.dart';

@RoutePage()
class AccessibilityPage extends HookConsumerWidget {
  const AccessibilityPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context).accessibility;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.title),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(t.language),
            subtitle: Text(
              ref.watch(languageSettingProvider).when(
                    data: (data) => data.translations.language,
                    loading: () => '',
                    error: (e, _) => '',
                  ),
            ),
            onTap: () {
              SelectModalTile.consumerBuilder(
                context,
                itemCount: AppLocale.values.length,
                builder: (context, index, ref) {
                  final data = AppLocale.values[index];
                  return ListTile(
                    title: Text(data.translations.language),
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
            title: Text(t.theme),
            subtitle: Text(
              ref.watch(themeSettingProvider).when(
                    data: (data) => t.themeMode(context: data),
                    loading: () => '',
                    error: (e, _) => '',
                  ),
            ),
            onTap: () {
              SelectModalTile.consumerBuilder(
                context,
                itemCount: ThemeMode.values.length,
                builder: (context, index, ref) {
                  final data = ThemeMode.values[index];
                  return ListTile(
                    title: Text(t.themeMode(context: data)),
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
