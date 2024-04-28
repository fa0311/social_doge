import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_doge/app/router.dart';
import 'package:social_doge/component/part/confirm.dart';

@RoutePage()
class SettingPage extends HookConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
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
                await context.router.push(
                  SetupRoute(
                    onResult: (context) {
                      context.router.maybePop();
                    },
                  ),
                );
              },
            ),
            ListTile(
              onTap: () {
                showDialog<void>(
                  context: context,
                  builder: (BuildContext context) => ConfirmDialog(
                    content: Text(AppLocalizations.of(context)!.logoutConfirm),
                    onPressed: () async {
                      final cookie = CookieManager.instance();
                      await cookie.deleteAllCookies();
                      if (context.mounted) {
                        await context.router.replaceAll([
                          LoginRoute(
                            onResult: (context) {
                              context.router.replaceAll([const SocialDogeRoute()]);
                            },
                          ),
                        ]);
                      }
                    },
                  ),
                );
              },
              leading: const Icon(Icons.home),
              title: Text(AppLocalizations.of(context)!.logout),
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.help),
              leading: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.help)],
              ),
              onTap: () {
                context.router.push(const InfoRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}
