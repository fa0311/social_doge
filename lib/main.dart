import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:social_doge/component/loading.dart';
import 'package:social_doge/constant/config.dart';
import 'package:social_doge/database/self_account.dart';
import 'package:social_doge/view/settings/accessibility.dart';
import 'package:social_doge/view/web/login.dart';
part 'main.g.dart';

void main() {
  runApp(const ProviderScope(child: SocialDoge()));
}

@riverpod
Future<void> init(InitRef ref) async {
  await Future.wait([
    ref.read(languageCodeProvider.notifier).get(),
    ref.read(themeBrightnessProvider(false).notifier).get(),
    ref.read(themeBrightnessProvider(true).notifier).get(),
    ref.read(selfAccountProvider.notifier).get(),
  ]);
}

class SocialDoge extends ConsumerWidget {
  const SocialDoge({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageCode = ref.watch(languageCodeProvider);
    final themeBrightness = ref.watch(themeBrightnessProvider(false));
    final darkThemeBrightness = ref.watch(themeBrightnessProvider(true));

    return MaterialApp(
      title: Config.title,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(languageCode.name, ''),
      theme: themeBrightness.toTheme(),
      darkTheme: darkThemeBrightness.toTheme(),
      home: const SocialDogeInit(),
    );
  }
}

class SocialDogeInit extends ConsumerWidget {
  const SocialDogeInit({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final init = ref.watch(initProvider);

    return init.when(
      data: (_) => const TwitterLogin(),
      error: (error, stackTrace) => Column(
        children: [
          for (final e in [error.toString(), stackTrace.toString()]) Text(e)
        ],
      ),
      loading: () => SizedBox(height: MediaQuery.of(context).size.height, child: const Center(child: Loading())),
    );
  }
}
