// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_doge/view/settings/accessibility.dart';

// Project imports:
import 'package:social_doge/view/web/login.dart';

class NormalDrawer extends ConsumerWidget {
  const NormalDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).colorScheme.background),
              accountName: const Text("accountName"),
              accountEmail: const Text("accountEmail"),
              currentAccountPicture: CachedNetworkImage(
                imageUrl: "https://pbs.twimg.com/profile_images/1449745429801811978/lHINmMuy_400x400.jpg",
                fit: BoxFit.fitWidth,
                errorWidget: (context, url, error) => const Icon(Icons.error),
                imageBuilder: (context, imageProvider) => CircleAvatar(backgroundImage: imageProvider),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      onTap: () async {
                        final cookie = CookieManager.instance();
                        await cookie.deleteAllCookies();
                        await Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const TwitterLogin()), (_) => false);
                      },
                      leading: const Icon(Icons.home),
                      title: Text(AppLocalizations.of(context)!.logout),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(AppLocalizations.of(context)!.close),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                const Divider(),
                ListTile(
                  onTap: () => {},
                  leading: const Icon(Icons.settings),
                  title: Text(AppLocalizations.of(context)!.setting),
                ),
              ],
            ),
            Column(
              children: [
                const Divider(),
                ListTile(
                  onTap: () async {
                    await Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsAccessibility()), (_) => false);
                  },
                  leading: const Icon(Icons.settings),
                  title: Text(AppLocalizations.of(context)!.setting),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
