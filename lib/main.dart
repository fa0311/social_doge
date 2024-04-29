import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_doge/app/router.dart';
import 'package:social_doge/constant/config.dart';
import 'package:social_doge/i18n/translations.g.dart';
import 'package:social_doge/provider/key_value_storage/storage.dart';
import 'package:social_doge/util/logger.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  runApp(
    ProviderScope(
      observers: [ProviderLogger()],
      child: TranslationProvider(
        child: const SocialDoge(),
      ),
    ),
  );
}

class SocialDoge extends HookConsumerWidget {
  const SocialDoge({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = useMemoized(() => AppRouter(ref), []);
    final locale = ref.watch(languageSettingProvider.notifier);
    final theme = ref.watch(themeSettingProvider);

    ref.listen(languageSettingProvider, (prev, next) {
      if (next.valueOrNull != null) {
        LocaleSettings.setLocale(next.valueOrNull!);
      }
    });

    return MaterialApp.router(
      title: Config.title,
      debugShowCheckedModeBanner: Config.debugShowCheckedModeBanner,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: AppLocaleUtils.supportedLocales,
      locale: locale.toLocale(),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Config.seedColor,
          brightness: switch (theme.valueOrNull) {
            ThemeMode.dark => Brightness.dark,
            _ => Brightness.light,
          },
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
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
