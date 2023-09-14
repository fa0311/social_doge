import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:social_doge/component/confirm.dart';
import 'package:social_doge/component/loading.dart';
import 'package:social_doge/database/core.dart';
import 'package:social_doge/database/provider.dart';
import 'package:social_doge/database/self_account.dart';
import 'package:social_doge/view/sub/synchronized.dart';
part 'main.g.dart';

@riverpod
Future<void> removeLastSynchronized(RemoveLastSynchronizedRef ref) async {
  final userId = ref.watch(selfAccountProvider.notifier).id;
  final db = ref.read(getDatabaseProvider);
  final time = await db.followersLastTime(userId: userId);
  await db.deleteFollowers(userId: userId, time: time);
}

@riverpod
Future<List<List<FollowersCount>>> socialDogeMain(SocialDogeMainRef ref) async {
  final userId = ref.watch(selfAccountProvider.notifier).id;
  final db = ref.read(getDatabaseProvider);

  return Future.wait([
    db.followersCountByTime(userId: userId, duration: const Duration(days: 30)),
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

class SocialDogeMain extends ConsumerWidget {
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
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute<void>(builder: (context) => const Synchronize()), (_) => false);
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

class FollowerChart extends ConsumerWidget {
  FollowerChart({super.key, required this.data});
  final List<FollowersCount> data;
  final List<Color> gradientColors = [Colors.cyan, Colors.blue];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (data.isEmpty) {
      return Center(child: Text(AppLocalizations.of(context)!.noData));
    }
    if (data.length == 1) {
      data.add(FollowersCount(data.first.time.add(const Duration(seconds: 1)), data.first.count));
    }
    return LineChart(
      LineChartData(
        lineTouchData: LineTouchData(
          getTouchedSpotIndicator: (LineChartBarData barData, List<int> spotIndexes) {
            return spotIndexes.map((spotIndex) {
              return TouchedSpotIndicatorData(
                const FlLine(color: Colors.blue),
                FlDotData(
                  getDotPainter: (spot, percent, barData, index) {
                    return FlDotCirclePainter(color: Colors.blue, radius: 3, strokeWidth: 0);
                  },
                ),
              );
            }).toList();
          },
          touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: Colors.white.withAlpha(0),
            tooltipPadding: EdgeInsets.zero,
            getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
              return touchedBarSpots.map((barSpot) => LineTooltipItem(barSpot.y.toInt().toString(), const TextStyle(color: Colors.blue))).toList();
            },
          ),
        ),
        gridData: const FlGridData(show: false, horizontalInterval: 1, verticalInterval: 1),
        titlesData: FlTitlesData(
          rightTitles: const AxisTitles(),
          topTitles: const AxisTitles(),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: data.last.time.millisecondsSinceEpoch - data.first.time.millisecondsSinceEpoch / 5,
              getTitlesWidget: (value, meta) {
                if (meta.min == meta.max) {
                  return Text(value.toInt().toString());
                }
                if (meta.min == value || meta.max == value) {
                  return Container();
                }
                final year = meta.max - meta.min > 60 * 60 * 24 * 365 * 1000;
                final date = DateTime.fromMillisecondsSinceEpoch(value.toInt(), isUtc: true);
                final format = year ? DateFormat(AppLocalizations.of(context)!.dateFormat1) : DateFormat(AppLocalizations.of(context)!.dateFormat2);
                return Text(format.format(date), softWrap: false);
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: data.sorted((a, b) => a.count.compareTo(b.count)).last.count.toString().length * 8 + 5,
              getTitlesWidget: (value, meta) {
                if (meta.min == meta.max) {
                  return Text(value.toInt().toString());
                }
                if (meta.min == value || meta.max == value) {
                  return Container();
                }
                return Text(value.toInt().toString());
              },
            ),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: data.map((e) => FlSpot(e.time.millisecondsSinceEpoch.toDouble(), e.count.toDouble())).toList(),
            // isCurved: true,
            gradient: LinearGradient(colors: gradientColors),
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(colors: gradientColors.map((color) => color.withOpacity(0.4)).toList()),
            ),
          ),
        ],
      ),
    );
  }
}
