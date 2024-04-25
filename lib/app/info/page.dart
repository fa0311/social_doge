import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_doge/app/router.dart';
import 'package:social_doge/component/widget/error_log_view.dart';
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
                ListTile(
                  title: Text(AppLocalizations.of(context)!.contribution),
                  subtitle: Text(AppLocalizations.of(context)!.contributionDetails),
                  onTap: () async {
                    if (await canLaunchUrl(Config.repository)) {
                      await launchUrl(Config.repository, mode: LaunchMode.externalApplication);
                    }
                  },
                ),
                ListTile(
                  title: Text(AppLocalizations.of(context)!.report),
                  subtitle: Text(AppLocalizations.of(context)!.reportDetails),
                  onTap: () async {
                    if (await canLaunchUrl(Config.issues)) {
                      await launchUrl(Config.issues, mode: LaunchMode.externalApplication);
                    }
                  },
                ),
                ListTile(
                  title: Text(AppLocalizations.of(context)!.developerInfo),
                  subtitle: Text(AppLocalizations.of(context)!.developerInfoDetails),
                  onTap: () async {
                    if (await canLaunchUrl(Config.contact)) {
                      await launchUrl(Config.contact, mode: LaunchMode.externalApplication);
                    }
                  },
                ),
                ListTile(
                  title: Text(AppLocalizations.of(context)!.version),
                  subtitle: version.when(
                    data: (data) => Text(AppLocalizations.of(context)!.versionDetails(data.version)),
                    loading: () => const SizedBox(),
                    error: ErrorLogView.new,
                  ),
                  onTap: () async {
                    if (await canLaunchUrl(Config.release)) {
                      await launchUrl(Config.release, mode: LaunchMode.externalApplication);
                    }
                  },
                ),
                ListTile(
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
