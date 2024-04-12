import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_doge/app/router.dart';
import 'package:social_doge/constant/config.dart';
import 'package:social_doge/provider/key_value_storage/storage.dart';

void main() {
  runApp(const ProviderScope(child: SocialDoge()));
}

class SocialDoge extends HookConsumerWidget {
  const SocialDoge({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = useMemoized(() => AppRouter(ref), []);
    final locale = ref.watch(languageSettingProvider);
    final theme = ref.watch(themeSettingProvider);

    return MaterialApp.router(
      title: Config.title,
      debugShowCheckedModeBanner: Config.debugShowCheckedModeBanner,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: locale.valueOrNull,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Config.seedColor,
          brightness: switch (theme.valueOrNull) {
            ThemeMode.dark => Brightness.dark,
            _ => Brightness.light,
          },
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Config.seedColor,
          brightness: switch (theme.valueOrNull) {
            ThemeMode.light => Brightness.light,
            _ => Brightness.dark,
          },
        ),
      ),
      routerConfig: appRouter.config(),
    );
  }
}
