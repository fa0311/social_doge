// Dart imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Package imports:
import 'package:package_info_plus/package_info_plus.dart';
import 'package:social_doge/component/future/tile.dart';
import 'package:social_doge/constant/config.dart';

import 'package:url_launcher/url_launcher.dart';

final versionProvider = FutureProvider((ref) async => await PackageInfo.fromPlatform());

class Help extends ConsumerWidget {
  const Help({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<PackageInfo> version = ref.watch(versionProvider);
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
                    subtitle: const Text(""),
                    trailing: const Padding(
                      padding: EdgeInsets.only(right: 2, top: 2),
                      child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator()),
                    ),
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
                  onTap: () => showLicense(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> showLicense(BuildContext context) async {
  final PackageInfo info = await PackageInfo.fromPlatform();

  showLicensePage(
    context: context,
    applicationName: info.appName,
    applicationVersion: info.version,
    applicationLegalese: '2022 yuki',
  );
}
