import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_doge/component/part/loading.dart';
import 'package:social_doge/component/widget/error_log_view.dart';
import 'package:social_doge/constant/config.dart';
import 'package:social_doge/provider/package_info.dart';

@RoutePage()
class InfoLicensePage extends HookConsumerWidget {
  const InfoLicensePage({super.key});

  static const copyRight = '©';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final year = DateTime.now().year;
    return Scaffold(
      body: ref.watch(packageVersionProvider).when(
            data: (info) {
              return LicensePage(
                applicationName: info.appName,
                applicationVersion: info.version,
                applicationLegalese: '$copyRight $year ${Config.author}',
              );
            },
            loading: () => const Loading(),
            error: ErrorLogView.new,
          ),
    );
  }
}
