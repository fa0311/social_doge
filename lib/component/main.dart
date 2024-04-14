import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:social_doge/app/router.dart';
import 'package:social_doge/component/chart.dart';
import 'package:social_doge/component/part/confirm.dart';
import 'package:social_doge/component/part/loading.dart';
import 'package:social_doge/infrastructure/database/core.dart';
import 'package:social_doge/infrastructure/database/provider.dart';
import 'package:social_doge/infrastructure/database/self_account.dart';

part 'main.g.dart';

@riverpod
Future<void> removeLastSynchronized(RemoveLastSynchronizedRef ref) async {
  final userId = await ref.watch(selfAccountProvider.future);
  final db = ref.read(getDatabaseProvider);
  final time = await db.followersLastTime(userId: userId!);
  await db.deleteFollowers(userId: userId, time: time);
}

@riverpod
Future<List<List<FollowersCount>>> socialDogeMain(SocialDogeMainRef ref) async {
  final userId = await ref.watch(selfAccountProvider.future);
  final db = ref.read(getDatabaseProvider);

  return Future.wait([
    db.followersCountByTime(userId: userId!, duration: const Duration(days: 30)),
    db.followersCountByTime(userId: userId, duration: const Duration(days: 90)),
    db.followersCountByTime(userId: userId, duration: const Duration(days: 360)),
    db.followersCountByTime(userId: userId, duration: const Duration(days: 3600)),
  ]);
}

class SocialDogeMainPageView {
  SocialDogeMainPageView(this.label, this.provider);
  final String label;
  final AsyncValue<List<FollowersCount>> provider;
}

class SocialDogeMain extends HookConsumerWidget {
  SocialDogeMain({super.key});

  final List<Color> gradientColors = [Colors.cyan, Colors.blue];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(socialDogeMainProvider);
    final labels = [
      AppLocalizations.of(context)!.oneMonth,
      AppLocalizations.of(context)!.threeMonths,
      AppLocalizations.of(context)!.oneYear,
      AppLocalizations.of(context)!.totalPeriod,
    ];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: AspectRatio(
              aspectRatio: 1.50,
              child: data.when(
                data: (data) {
                  return PageView(
                    children: [
                      for (final e in data.asMap().entries)
                        Column(
                          children: [
                            Text(labels[e.key]),
                            Expanded(
                              child: Padding(padding: const EdgeInsets.all(8), child: FollowerChart(data: e.value)),
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
            context.router.push(const SynchronizeRoute());
          },
        ),
        data.when(
          data: (data) {
            return ListTile(
              title: Text(AppLocalizations.of(context)!.deleteLastSynchronize),
              subtitle: Text(AppLocalizations.of(context)!.deleteLastSynchronizeDetails),
              enabled: data.isNotEmpty,
              onTap: () async {
                await showDialog<void>(
                  context: context,
                  builder: (BuildContext context) => ConfirmDialog(
                    content: Text(AppLocalizations.of(context)!.deleteLastSynchronize),
                    onPressed: () async {
                      await ref.read(removeLastSynchronizedProvider.future);
                    },
                  ),
                );
              },
            );
          },
          error: (error, stackTrace) => Column(
            children: [
              for (final e in [error.toString(), stackTrace.toString()]) Text(e),
            ],
          ),
          loading: () => const LoadingIcon(),
        ),
      ],
    );
  }
}
