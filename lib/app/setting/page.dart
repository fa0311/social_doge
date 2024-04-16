import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_doge/app/router.dart';

@RoutePage()
class SettingPage extends HookConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      drawerEdgeDragWidth: MediaQuery.of(context).padding.left + 40,
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.setting)),
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: Text(AppLocalizations.of(context)!.accessibility),
              leading: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.accessibility)],
              ),
              onTap: () async {
                await context.router.push(const AccessibilityRoute());
              },
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.account),
              leading: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.account_circle)],
              ),
              onTap: () async {
                // await Navigator.push(context, MaterialPageRoute<void>(builder: (_) => const AccountSettingsScaffold()));
              },
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.help),
              leading: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.help)],
              ),
              onTap: () async {
                // await Navigator.push(context, MaterialPageRoute<void>(builder: (_) => const InfoPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
