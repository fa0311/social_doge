// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:social_doge/view/web/login.dart';

// Package imports:

main() {
  runApp(const ProviderScope(child: SocialDoge()));
}

class SocialDoge extends ConsumerWidget {
  const SocialDoge({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Twitter Doge',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: AppLocalizations.supportedLocales[0],
      supportedLocales: AppLocalizations.supportedLocales,
      home: const TwitterLogin(),
    );
  }
}
