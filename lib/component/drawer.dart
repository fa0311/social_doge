import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_doge/app/router.dart';
import 'package:social_doge/component/part/confirm.dart';
import 'package:social_doge/component/part/loading.dart';
import 'package:social_doge/component/widget/error_log_view.dart';
import 'package:social_doge/provider/twitter/account.dart';
import 'package:social_doge/util/twitter.dart';

class NormalDrawer extends HookConsumerWidget {
  const NormalDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 169,
              child: ref.watch(getSelfAccountProvider).when(
                    data: (data) {
                      return UserAccountsDrawerHeader(
                        decoration: BoxDecoration(color: Theme.of(context).colorScheme.background),
                        accountName: Text(data.legacy.screenName),
                        accountEmail: Text(data.restId),
                        currentAccountPicture: CachedNetworkImage(
                          imageUrl: ProfileImageUrlHttps(data.legacy.profileImageUrlHttps).original,
                          fit: BoxFit.fitWidth,
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                          imageBuilder: (context, imageProvider) => CircleAvatar(backgroundImage: imageProvider),
                        ),
                      );
                    },
                    error: ErrorLogView.new,
                    loading: Loading.new,
                  ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
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
                                await context.router.push(const SocialDogeRoute());
                              }
                            },
                          ),
                        );
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
                  onTap: () async {
                    await context.router.push(const SettingRoute());
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
