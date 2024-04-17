import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class FollowerChart extends HookConsumerWidget {
  FollowerChart({super.key, required this.data, this.duration});
  final List<({int count, DateTime time})> data;
  final Duration? duration;
  final List<Color> gradientColors = [Colors.cyan, Colors.blue];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (data.isEmpty) {
      return Center(child: Text(AppLocalizations.of(context)!.noData));
    }
    if (data.length == 1) {
      data.add((time: data.first.time.add(const Duration(seconds: 1)), count: data.first.count));
    }
    return LineChart(
      LineChartData(
        minX: duration == null ? null : DateTime.now().subtract(duration!).millisecondsSinceEpoch.toDouble(),
        lineTouchData: LineTouchData(
          getTouchedSpotIndicator: (LineChartBarData barData, List<int> spotIndexes) {
            return spotIndexes.map((spotIndex) {
              return TouchedSpotIndicatorData(
                const FlLine(color: Colors.blue),
                FlDotData(
                  getDotPainter: (spot, percent, barData, index) {
                    return FlDotCirclePainter(color: Colors.blue, radius: 3);
                  },
                ),
              );
            }).toList();
          },
          touchTooltipData: LineTouchTooltipData(
            getTooltipColor: (_) => Colors.white.withAlpha(0),
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
