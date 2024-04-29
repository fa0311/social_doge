import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_doge/component/part/label.dart';
import 'package:social_doge/component/part/loading.dart';
import 'package:social_doge/component/widget/error_log_view.dart';
import 'package:social_doge/i18n/translations.g.dart';
import 'package:social_doge/infrastructure/database/data.dart';
import 'package:social_doge/provider/db/db.dart';
import 'package:social_doge/provider/twitter/synchronize.dart';

@RoutePage()
class SynchronizePage extends HookConsumerWidget {
  const SynchronizePage({super.key});

  static const channelId = 'foreground_service';

  Future<bool> requestPermissionForAndroid() async {
    final batteryOptimization = await FlutterForegroundTask.isIgnoringBatteryOptimizations;
    final notificationPermission = await () async {
      final notificationPermissionStatus = await FlutterForegroundTask.checkNotificationPermission();
      return notificationPermissionStatus == NotificationPermission.granted;
    }();
    return batteryOptimization && notificationPermission;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context).synchronize;
    final following = ref.watch(runSynchronizeProvider(SynchronizeMode.following));
    final follower = ref.watch(runSynchronizeProvider(SynchronizeMode.follower));

    ref
      ..listen(runSynchronizeProvider(SynchronizeMode.following), (previous, next) {
        if (previous?.valueOrNull?.finish == false && next.valueOrNull?.finish == true) {
          // ignore: unused_result
          ref.refresh(getUserSyncStatusProvider(SynchronizeMode.following));
        }
      })
      ..listen(runSynchronizeProvider(SynchronizeMode.follower), (previous, next) {
        if (previous?.valueOrNull?.finish == false && next.valueOrNull?.finish == true) {
          // ignore: unused_result
          ref.refresh(getUserSyncStatusProvider(SynchronizeMode.follower));
        }
      });

    final permission = useFuture(useMemoized(requestPermissionForAndroid));

    useEffect(() {
      final timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
        final data = await Future.wait([
          ref.read(runSynchronizeProvider(SynchronizeMode.following).future),
          ref.read(runSynchronizeProvider(SynchronizeMode.follower).future),
        ]);

        final (following, follower) = (data[0], data[1]);
        final finish = following.finish && follower.finish;

        if (finish) {
          await FlutterForegroundTask.updateService(
            notificationTitle: t.finish.title,
            notificationText: t.finish.description,
          );
          timer.cancel();
        } else {
          await FlutterForegroundTask.updateService(
            notificationTitle: t.notificationTitle[timer.tick % t.notificationTitle.length],
            notificationText: [
              t.notification.text1(count: following.progress, total: following.length),
              t.notification.text2(count: follower.progress, total: follower.length),
            ].join('\n'),
          );
        }
      });
      return timer.cancel;
    });

    return WillStartForegroundTask(
      onWillStart: () => Future.value(true),
      androidNotificationOptions: AndroidNotificationOptions(
        channelId: channelId,
        channelName: t.channel.name,
        channelDescription: t.channel.description,
      ),
      iosNotificationOptions: const IOSNotificationOptions(),
      foregroundTaskOptions: const ForegroundTaskOptions(),
      notificationTitle: t.notificationTitle[0],
      notificationText: t.notification.text,
      child: Scaffold(
        appBar: AppBar(
          title: Text(t.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: switch ((following, follower)) {
            (AsyncData(value: final following), AsyncData(value: final follower)) => Column(
                children: [
                  for (final messages in [following, follower]) ...[
                    Text('${messages.progress}/${messages.length}'),
                    ClipRRect(
                      child: LinearProgressIndicator(
                        value: messages.progress / messages.length,
                      ),
                    ),
                    if (messages.wait != null) ...[
                      Text(t.apiLimit.title),
                      Text(t.apiLimit.description(sec: messages.wait!)),
                    ],
                  ],
                  switch ((following.finish, follower.finish, permission.data)) {
                    (true, true, _) => Padding(
                        padding: const EdgeInsets.all(8),
                        child: SuccessLabel(
                          child: Text(t.success, style: const TextStyle(color: Colors.black)),
                        ),
                      ),
                    (_, _, true) => Padding(
                        padding: const EdgeInsets.all(8),
                        child: AlertLabel(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(t.alert.title, style: const TextStyle(color: Colors.black)),
                              Text(t.alert.description, style: const TextStyle(color: Colors.black)),
                            ],
                          ),
                        ),
                      ),
                    (_, _, false) => Padding(
                        padding: const EdgeInsets.all(8),
                        child: AlertLabel(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(t.warning.title, style: const TextStyle(color: Colors.black)),
                              Text(t.warning.description, style: const TextStyle(color: Colors.black)),
                            ],
                          ),
                        ),
                      ),
                    (_, _, null) => const Loading(),
                  },
                  Expanded(child: Container()),
                  switch ((following.finish, follower.finish)) {
                    (true, true) => ElevatedButton(
                        onPressed: () {
                          context.router.maybePop();
                        },
                        child: Text(t.close),
                      ),
                    (_, _) => ElevatedButton(
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
                        onPressed: () {
                          context.router.maybePop();
                        },
                        child: Text(t.cancel, style: const TextStyle(color: Colors.white)),
                      ),
                  },
                ],
              ),
            (AsyncLoading(:final error?, :final stackTrace?), _) => ErrorLogView(error, stackTrace),
            (_, AsyncLoading(:final error?, :final stackTrace?)) => ErrorLogView(error, stackTrace),
            _ => const Loading(),
          },
        ),
      ),
    );
  }
}
