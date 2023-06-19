import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:social_doge/component/confirm.dart';
import 'package:social_doge/component/loading.dart';
import 'package:social_doge/database/self_account.dart';
import 'package:social_doge/view/sub/synchronized.dart';
import 'package:social_doge/view/top/home.dart';
part 'main.g.dart';

@riverpod
Future<List<FollowersCount>> getFollowersCount(GetFollowersCountRef ref, int? time) async {
  final args = time == null ? 0 : DateTime.now().millisecondsSinceEpoch - time;
  final userId = ref.watch(selfAccountProvider);

  final db = await ref.read(getDatabaseProvider.future);
  final response = await db.query(
    'user_followers',
    columns: ['time', 'count(*)'],
    where: 'self_twitter_id = ?',
    groupBy: 'time',
    having: 'time > ?',
    whereArgs: [userId, args],
    orderBy: 'time ASC',
  );
  return response.map((row) => FollowersCount(row['time']! as int, row['count(*)']! as int)).toList();
}

@riverpod
Future<void> removeLastSynchronized(RemoveLastSynchronizedRef ref) async {
  final db = await ref.read(getDatabaseProvider.future);
  final time = await db.query('user_followers', columns: ['time'], orderBy: 'time DESC', limit: 1);
  await db.delete('user_followers', where: 'time = ?', whereArgs: [time.first['time']! as int]);
  await Future.wait([
    ref.refresh(getFollowersCountProvider(60 * 60 * 24 * 30 * 1000).future),
    ref.refresh(getFollowersCountProvider(60 * 60 * 24 * 90 * 1000).future),
    ref.refresh(getFollowersCountProvider(60 * 60 * 24 * 365 * 1000).future),
    ref.refresh(getFollowersCountProvider(null).future),
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
    final data = [
      SocialDogeMainPageView(AppLocalizations.of(context)!.oneMonth, ref.watch(getFollowersCountProvider(60 * 60 * 24 * 30 * 1000))),
      SocialDogeMainPageView(AppLocalizations.of(context)!.threeMonths, ref.watch(getFollowersCountProvider(60 * 60 * 24 * 90 * 1000))),
      SocialDogeMainPageView(AppLocalizations.of(context)!.oneYear, ref.watch(getFollowersCountProvider(60 * 60 * 24 * 365 * 1000))),
      SocialDogeMainPageView(AppLocalizations.of(context)!.totalPeriod, ref.watch(getFollowersCountProvider(null))),
    ];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: AspectRatio(
              aspectRatio: 1.50,
              child: PageView(
                children: [
                  for (final e in data)
                    Column(
                      children: [
                        Text(e.label),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: e.provider.when(
                              data: (data) => FollowerChart(data: data),
                              error: (error, stackTrace) => Column(
                                children: [
                                  for (final e in [error.toString(), stackTrace.toString()]) Text(e)
                                ],
                              ),
                              loading: () => const Loading(),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
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
        data.last.provider.when(
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
              for (final e in [error.toString(), stackTrace.toString()]) Text(e)
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
      data.add(FollowersCount(data.first.time + 1, data.first.count));
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
              interval: data.last.time.toDouble() - data.first.time.toDouble() / 5,
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
            spots: data.map((e) => FlSpot(e.time.toDouble(), e.count.toDouble())).toList(),
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
