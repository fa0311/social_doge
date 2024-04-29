import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_doge/app/router.dart';
import 'package:social_doge/component/part/confirm.dart';
import 'package:social_doge/i18n/translations.g.dart';

@RoutePage()
class SettingPage extends HookConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context).setting;

    return Scaffold(
      appBar: AppBar(title: Text(t.title)),
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: Text(t.accessibility.title),
              leading: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.accessibility)],
              ),
              onTap: () async {
                await context.router.push(const AccessibilityRoute());
              },
            ),
            ListTile(
              title: Text(t.account.title),
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
                    title: Text(t.logout.title),
                    ok: Text(t.logout.ok),
                    content: Text(t.logout.confirm),
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
              title: Text(t.logout.title),
            ),
            ListTile(
              title: Text(t.help.title),
              leading: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.help)],
              ),
              onTap: () {
                context.router.push(const HelpRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}
