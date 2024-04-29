import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_doge/app/router.dart';
import 'package:social_doge/component/part/loading.dart';
import 'package:social_doge/component/widget/error_log_view.dart';
import 'package:social_doge/i18n/translations.g.dart';
import 'package:social_doge/provider/twitter/account.dart';
import 'package:social_doge/util/twitter.dart';

class NormalDrawer extends HookConsumerWidget {
  const NormalDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context).drawer;
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
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(t.close),
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
                  title: Text(t.setting),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
