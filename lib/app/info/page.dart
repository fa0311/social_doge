import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_doge/app/router.dart';
import 'package:social_doge/component/part/future/tile.dart';
import 'package:social_doge/component/part/loading.dart';
import 'package:social_doge/constant/config.dart';
import 'package:social_doge/provider/package_info.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class InfoPage extends HookConsumerWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final version = ref.watch(packageVersionProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.help),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                FutureTile(
                  title: Text(AppLocalizations.of(context)!.contribution),
                  subtitle: Text(AppLocalizations.of(context)!.contributionDetails),
                  onTap: () async {
                    if (await canLaunchUrl(Config.repository)) {
                      await launchUrl(Config.repository, mode: LaunchMode.externalApplication);
                    }
                  },
                ),
                FutureTile(
                  title: Text(AppLocalizations.of(context)!.report),
                  subtitle: Text(AppLocalizations.of(context)!.reportDetails),
                  onTap: () async {
                    if (await canLaunchUrl(Config.issues)) {
                      await launchUrl(Config.issues, mode: LaunchMode.externalApplication);
                    }
                  },
                ),
                FutureTile(
                  title: Text(AppLocalizations.of(context)!.developerInfo),
                  subtitle: Text(AppLocalizations.of(context)!.developerInfoDetails),
                  onTap: () async {
                    if (await canLaunchUrl(Config.contact)) {
                      await launchUrl(Config.contact, mode: LaunchMode.externalApplication);
                    }
                  },
                ),
                version.when(
                  loading: () => ListTile(
                    title: Text(AppLocalizations.of(context)!.version),
                    trailing: const LoadingIcon(),
                  ),
                  error: (e, trace) {
                    return ListTile(
                      title: Text(AppLocalizations.of(context)!.version),
                      subtitle: Text(AppLocalizations.of(context)!.error),
                    );
                  },
                  data: (data) => FutureTile(
                    title: Text(AppLocalizations.of(context)!.version),
                    subtitle: Text(AppLocalizations.of(context)!.versionDetails(data.version)),
                    onTap: () async {
                      if (await canLaunchUrl(Config.release)) {
                        await launchUrl(Config.release, mode: LaunchMode.externalApplication);
                      }
                    },
                  ),
                ),
                FutureTile(
                  title: Text(AppLocalizations.of(context)!.license),
                  subtitle: Text(AppLocalizations.of(context)!.licenseDetails),
                  onTap: () => context.router.push(const InfoLicenseRoute()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
