import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_doge/app/router.dart';
import 'package:social_doge/component/chart.dart';
import 'package:social_doge/component/part/loading.dart';
import 'package:social_doge/component/part/physics.dart';
import 'package:social_doge/component/widget/error_log_view.dart';
import 'package:social_doge/i18n/translations.g.dart';
import 'package:social_doge/infrastructure/database/data.dart';
import 'package:social_doge/provider/db/db.dart';

@RoutePage()
class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  Future<bool> requestPermissionForAndroid() async {
    final batteryOptimization = await () async {
      if (await FlutterForegroundTask.isIgnoringBatteryOptimizations) {
        return true;
      } else {
        final res = await FlutterForegroundTask.requestIgnoreBatteryOptimization();
        return res;
      }
    }();
    final notificationPermission = await () async {
      final notificationPermissionStatus = await FlutterForegroundTask.checkNotificationPermission();
      if (notificationPermissionStatus == NotificationPermission.granted) {
        return true;
      } else {
        final res = await FlutterForegroundTask.requestNotificationPermission();
        return res == NotificationPermission.granted;
      }
    }();
    return batteryOptimization && notificationPermission;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context).home;

    final follower = ref.watch(getUserSyncStatusProvider(SynchronizeMode.follower));
    final labels = [
      (t.totalPeriod, null),
      (t.oneMonth, const Duration(days: 30)),
      (t.threeMonths, const Duration(days: 90)),
      (t.oneYear, const Duration(days: 360)),
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
                    physics: const FastScrollPhysics(),
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
                error: ErrorLogView.new,
                loading: () => const Loading(),
              ),
            ),
          ),
        ),
        ListTile(
          title: Text(t.synchronize.title),
          subtitle: Text(t.synchronize.description),
          onTap: () {
            context.router.push(const SynchronizeRoute());
          },
        ),
        ListTile(
          title: Text(t.synchronize.remove.title),
          subtitle: Text(t.synchronize.remove.description),
          onTap: () {
            context.router.push(const ResultRemoveRoute());
          },
        ),
        ListTile(
          title: Text(t.synchronize.permission.title),
          subtitle: Text(t.synchronize.permission.description),
          onTap: () async {
            final res = await requestPermissionForAndroid();
            if (context.mounted) {
              if (res) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(t.synchronize.permission.success)));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(t.synchronize.permission.failure)));
              }
            }
          },
        ),
      ],
    );
  }
}
