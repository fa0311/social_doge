// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:social_doge/component/future/tile.dart';
import 'package:social_doge/provider/session.dart';
import 'package:social_doge/view/top/home.dart';
import 'package:social_doge/view/web/login.dart';

class NormalDrawer extends ConsumerWidget {
  const NormalDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            GestureDetector(
              /*
                onTapUp: (_) => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ,
                  ),
                ),
                */
              onLongPress: () {},
              child: UserAccountsDrawerHeader(
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
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      onTap: () => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SocialDogeHome(),
                        ),
                        (_) => false,
                      ),
                      leading: const Icon(Icons.home),
                      title: Text(AppLocalizations.of(context)!.home),
                    ),
                    FutureTile(
                      onTap: () async {
                        final session = await ref.read(loginSessionProvider.future);
                        await session.cookieJar.deleteAll();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SocialDogeWebLogin(),
                          ),
                          (_) => false,
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
            Column(children: [
              const Divider(),
              ListTile(
                onTap: () => {},
                leading: const Icon(Icons.settings),
                title: Text(AppLocalizations.of(context)!.setting),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
