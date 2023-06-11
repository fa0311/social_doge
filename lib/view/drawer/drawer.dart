// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_doge/component/loading.dart';
import 'package:social_doge/component/twitter/user_profile.dart';
import 'package:social_doge/database/self_account.dart';
import 'package:social_doge/interface/twitter.dart';
import 'package:social_doge/view/settings/settings.dart';

// Project imports:
import 'package:social_doge/view/web/login.dart';

class NormalDrawer extends ConsumerWidget {
  const NormalDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(selfAccountProvider);
    final user = ref.watch(twitterUserProvider(userId ?? ""));

    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            user.when(
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
              error: (error, stackTrace) => Column(children: [
                for (final e in [error.toString(), stackTrace.toString()]) Text(e)
              ]),
              loading: () => const Loading(),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
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
                  onTap: () async {
                    await Navigator.push(context, MaterialPageRoute(builder: (_) => const Settings()));
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
