// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:social_doge/component/loading.dart';
import 'package:social_doge/view/sub/synchronized.dart';
import 'package:social_doge/view/top/home.dart';

part 'main.g.dart';

@riverpod
Future<List<FollowersCount>> getFollowersCount(GetFollowersCountRef ref, int? time) async {
  final args = time == null ? 0 : DateTime.now().millisecondsSinceEpoch - time;

  final db = await ref.read(getDatabaseProvider.future);
  final response = await db.query("user_followers", columns: ["time", "count(*)"], groupBy: "time", having: "time > ?", whereArgs: [args], orderBy: "time ASC");
  return response.map((row) => FollowersCount(row["time"] as int, row["count(*)"] as int)).toList();
}

class SocialDogeMainPageView {
  SocialDogeMainPageView(this.label, this.provider);
  final String label;
  final AsyncValue<List<FollowersCount>> provider;
}

class SocialDogeMain extends ConsumerWidget {
  SocialDogeMain({Key? key}) : super(key: key);

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
                children: data.map((e) {
                  return Column(
                    children: [
                      Text(e.label),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: e.provider.when(
                            data: (data) => FollowerChart(data: data),
                            error: (error, stackTrace) => Column(children: [error.toString(), stackTrace.toString()].map((e) => Text(e)).toList()),
                            loading: () => const Loading(),
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ),
        ListTile(
          title: Text(AppLocalizations.of(context)!.synchronize),
          subtitle: Text(AppLocalizations.of(context)!.synchronizeDetails),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Synchronize()));
          },
        ),
        ListTile(
          title: Text(AppLocalizations.of(context)!.deleteLastSynchronize),
          subtitle: Text(AppLocalizations.of(context)!.deleteLastSynchronizeDetails),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Synchronize()));
          },
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
    return LineChart(
      LineChartData(
        lineTouchData: LineTouchData(
          getTouchedSpotIndicator: (LineChartBarData barData, List<int> spotIndexes) {
            return spotIndexes.map((spotIndex) {
              return TouchedSpotIndicatorData(
                FlLine(color: Colors.blue),
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
            tooltipPadding: const EdgeInsets.all(0),
            getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
              return touchedBarSpots.map((barSpot) => LineTooltipItem(barSpot.y.toInt().toString(), const TextStyle(color: Colors.blue))).toList();
            },
          ),
        ),
        gridData: FlGridData(show: false, drawVerticalLine: true, horizontalInterval: 1, verticalInterval: 1),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: (data.last.time.toDouble() - data.first.time.toDouble()) / 5,
              getTitlesWidget: (value, meta) {
                if (meta.min == value || meta.max == value) return Container();
                final year = meta.max - meta.min > 60 * 60 * 24 * 365 * 1000;
                final date = DateTime.fromMillisecondsSinceEpoch(value.toInt(), isUtc: true);
                final format = year ? DateFormat(AppLocalizations.of(context)!.dateFormat1) : DateFormat(AppLocalizations.of(context)!.dateFormat2);
                return Text(format.format(date).toString(), softWrap: false);
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: data.sorted((a, b) => a.count.compareTo(b.count)).first.count.toString().length * 10 + 5,
              getTitlesWidget: (value, meta) {
                if (meta.min == value || meta.max == value) return Container();
                return Text(value.toInt().toString());
              },
            ),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: data.map((e) => FlSpot(e.time.toDouble(), e.count.toDouble())).toList(),
            isCurved: true,
            gradient: LinearGradient(colors: gradientColors),
            dotData: FlDotData(show: false),
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
