import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_doge/app/router.dart';
import 'package:social_doge/component/widget/error_log_view.dart';
import 'package:social_doge/constant/config.dart';
import 'package:social_doge/i18n/translations.g.dart';
import 'package:social_doge/provider/package_info.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class HelpPage extends HookConsumerWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context).help;

    final version = ref.watch(packageVersionProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                ListTile(
                  title: Text(t.contribution.title),
                  subtitle: Text(t.contribution.description),
                  onTap: () async {
                    if (await canLaunchUrl(Config.repository)) {
                      await launchUrl(Config.repository, mode: LaunchMode.externalApplication);
                    }
                  },
                ),
                ListTile(
                  title: Text(t.report.title),
                  subtitle: Text(t.report.description),
                  onTap: () async {
                    if (await canLaunchUrl(Config.issues)) {
                      await launchUrl(Config.issues, mode: LaunchMode.externalApplication);
                    }
                  },
                ),
                ListTile(
                  title: Text(t.developer.title),
                  subtitle: Text(t.developer.description),
                  onTap: () async {
                    if (await canLaunchUrl(Config.contact)) {
                      await launchUrl(Config.contact, mode: LaunchMode.externalApplication);
                    }
                  },
                ),
                ListTile(
                  title: Text(t.version.title),
                  subtitle: version.when(
                    data: (data) => Text(t.version.description(version: '${data.version}+${data.buildNumber}')),
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
                  title: Text(t.license.title),
                  subtitle: Text(t.license.description),
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
