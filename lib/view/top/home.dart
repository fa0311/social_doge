// Flutter imports:
import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:social_doge/component/physics.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:social_doge/view/drawer/drawer.dart';
import 'package:social_doge/view/sub/synchronized.dart';

part 'home.g.dart';

@riverpod
class CurrentIndex extends _$CurrentIndex {
  @override
  CurrentIndexEnum build() => CurrentIndexEnum.home;
  void update(CurrentIndexEnum method) => state = method;
}

@riverpod
Future<List<FollowersCount>> getFollowersCount(GetFollowersCountRef ref, int? time) async {
  final args = time == null ? 0 : DateTime.now().millisecondsSinceEpoch - time;

  final db = await ref.read(getDatabaseProvider.future);
  final response = await db.query("user_followers", columns: ["time", "count(*)"], groupBy: "time", having: "time > ?", whereArgs: [args], orderBy: "time ASC");
  return response.map((row) => FollowersCount(row["time"] as int, row["count(*)"] as int)).toList();
}

class FollowersCount {
  FollowersCount(this.time, this.count);
  final int time;
  final int count;
}

enum CurrentIndexEnum {
  home(icon: Icons.home),
  latestTimeline(icon: Icons.home),
  bbb(icon: Icons.home);

  Widget toWidget() {
    switch (this) {
      case CurrentIndexEnum.home:
        return SocialDogeMain();
      // return const socialDogeTimeline();
      case CurrentIndexEnum.latestTimeline:
        return Container();
      // return const socialDogeLatestTimeline();
      case CurrentIndexEnum.bbb:
        return Container();
    }
  }

  String toLocalization(BuildContext context) {
    switch (this) {
      case CurrentIndexEnum.home:
        return AppLocalizations.of(context)!.home;
      case CurrentIndexEnum.latestTimeline:
        return AppLocalizations.of(context)!.home;
      case CurrentIndexEnum.bbb:
        return AppLocalizations.of(context)!.home;
    }
  }

  final IconData icon;
  const CurrentIndexEnum({required this.icon});
}

class SocialDogeHome extends ConsumerWidget {
  const SocialDogeHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);
    final controller = PageController(initialPage: currentIndex.index);

    return Scaffold(
      drawerEdgeDragWidth: MediaQuery.of(context).padding.left + 40,
      appBar: AppBar(
        title: Text(currentIndex.toLocalization(context)),
      ),
      drawer: const NormalDrawer(),
      body: SafeArea(
        child: PageView(
          controller: controller,
          physics: const FastScrollPhysics(),
          children: [for (CurrentIndexEnum scene in CurrentIndexEnum.values) scene.toWidget()],
          onPageChanged: (int index) {
            WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
            ref.read(currentIndexProvider.notifier).update(CurrentIndexEnum.values[index]);
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          for (CurrentIndexEnum scene in CurrentIndexEnum.values) BottomNavigationBarItem(icon: Icon(scene.icon), label: scene.toLocalization(context)),
        ],
        currentIndex: currentIndex.index,
        onTap: (int index) => controller.jumpToPage(index),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
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
      SocialDogeMainPageView("1ヶ月", ref.watch(getFollowersCountProvider(60 * 60 * 24 * 30 * 1000))),
      SocialDogeMainPageView("3ヶ月", ref.watch(getFollowersCountProvider(60 * 60 * 24 * 90 * 1000))),
      SocialDogeMainPageView("1年", ref.watch(getFollowersCountProvider(60 * 60 * 24 * 365 * 1000))),
      SocialDogeMainPageView("全期間", ref.watch(getFollowersCountProvider(null))),
    ];

    return Column(
      children: [
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Synchronized()));
          },
          child: const Text("data"),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: AspectRatio(
            aspectRatio: 1.50,
            child: PageView(
              children: data
                  .map((e) => Column(
                        children: [
                          Text(e.label),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: e.provider.when(
                                data: (data) => FollowerChart(data: data),
                                error: (error, stackTrace) => const Text("Error"),
                                loading: () => const CircularProgressIndicator(),
                              ),
                            ),
                          ),
                        ],
                      ))
                  .toList(),
            ),
          ),
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
                return Text((year ? DateFormat("yy/MM/dd") : DateFormat("MM/dd")).format(date).toString(), style: const TextStyle());
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: data.sorted((a, b) => a.count.compareTo(b.count)).first.count.toString().length * 20,
              getTitlesWidget: (value, meta) {
                if (meta.min == value || meta.max == value) return Container();
                return Text(value.toInt().toString(), style: const TextStyle());
              },
            ),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: data.map((e) => FlSpot(e.time.toDouble(), e.count.toDouble())).toList(),
            isCurved: true,
            gradient: LinearGradient(colors: gradientColors),
            dotData: FlDotData(
              show: false,
            ),
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
