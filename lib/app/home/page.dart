import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_doge/app/router.dart';
import 'package:social_doge/component/chart.dart';
import 'package:social_doge/component/part/loading.dart';
import 'package:social_doge/infrastructure/database/data.dart';
import 'package:social_doge/provider/db/db.dart';

@RoutePage()
class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  static List<Color> gradientColors = [Colors.cyan, Colors.blue];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final follower = ref.watch(getUserSyncStatusProvider(SynchronizeMode.follower));
    final labels = [
      (AppLocalizations.of(context)!.totalPeriod, null),
      (AppLocalizations.of(context)!.oneMonth, const Duration(days: 30)),
      (AppLocalizations.of(context)!.threeMonths, const Duration(days: 90)),
      (AppLocalizations.of(context)!.oneYear, const Duration(days: 360)),
    ];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: AspectRatio(
              aspectRatio: 1.50,
              child: follower.when(
                data: (follower) {
                  return PageView(
                    children: [
                      for (final e in labels)
                        Column(
                          children: [
                            Text(e.$1),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: FollowerChart(
                                  data: follower.map((e) => (count: e.count, time: e.time)).toList(),
                                  duration: e.$2,
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  );
                },
                error: (error, stackTrace) => Column(
                  children: [
                    for (final e in [error.toString(), stackTrace.toString()]) Text(e),
                  ],
                ),
                loading: () => const Loading(),
              ),
            ),
          ),
        ),
        ListTile(
          title: Text(AppLocalizations.of(context)!.synchronize),
          subtitle: Text(AppLocalizations.of(context)!.synchronizeDetails),
          onTap: () {
            context.router.replace(const SynchronizeRoute());
          },
        ),
        // data.when(
        //   data: (data) {
        //     return ListTile(
        //       title: Text(AppLocalizations.of(context)!.deleteLastSynchronize),
        //       subtitle: Text(AppLocalizations.of(context)!.deleteLastSynchronizeDetails),
        //       enabled: data.isNotEmpty,
        //       onTap: () async {
        //         await showDialog<void>(
        //           context: context,
        //           builder: (BuildContext context) => ConfirmDialog(
        //             content: Text(AppLocalizations.of(context)!.deleteLastSynchronize),
        //             onPressed: () async {
        //               await ref.read(removeLastSynchronizedProvider.future);
        //             },
        //           ),
        //         );
        //       },
        //     );
        //   },
        //   error: (error, stackTrace) => Column(
        //     children: [
        //       for (final e in [error.toString(), stackTrace.toString()]) Text(e),
        //     ],
        //   ),
        //   loading: () => const LoadingIcon(),
        // ),
      ],
    );
  }
}
