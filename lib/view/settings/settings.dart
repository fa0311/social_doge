// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_doge/view/settings/accessibility.dart';
import 'package:social_doge/view/settings/account.dart';

import 'help.dart';

// Project imports:

class Settings extends ConsumerWidget {
  const Settings({super.key});

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
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [Icon(Icons.accessibility)],
              ),
              onTap: () async {
                await Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsAccessibility()));
              },
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.account),
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [Icon(Icons.account_circle)],
              ),
              onTap: () async {
                await Navigator.push(context, MaterialPageRoute(builder: (_) => const Account()));
              },
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.help),
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [Icon(Icons.help)],
              ),
              onTap: () async {
                await Navigator.push(context, MaterialPageRoute(builder: (_) => const Help()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
