import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_doge/app/router.dart';
import 'package:social_doge/component/part/confirm.dart';
import 'package:social_doge/component/part/label.dart';
import 'package:social_doge/component/part/loading.dart';
import 'package:social_doge/infrastructure/database/data.dart';
import 'package:social_doge/provider/twitter/synchronize.dart';

@RoutePage()
class SynchronizePage extends HookConsumerWidget {
  const SynchronizePage({super.key});

  Future<void> _requestPermissionForAndroid() async {
    if (!Platform.isAndroid) {
      return;
    }
    if (!await FlutterForegroundTask.isIgnoringBatteryOptimizations) {
      await FlutterForegroundTask.requestIgnoreBatteryOptimization();
    }
    final notificationPermissionStatus = await FlutterForegroundTask.checkNotificationPermission();
    if (notificationPermissionStatus != NotificationPermission.granted) {
      await FlutterForegroundTask.requestNotificationPermission();
    }
  }

// void _onData(dynamic data) {
//     if (data is int) {
//       print('eventCount: $data');
//     } else if (data is String) {
//       if (data == 'onNotificationPressed') {
//         Navigator.of(context).pushNamed('/resume-route');
//       }
//     } else if (data is DateTime) {
//       print('timestamp: ${data.toString()}');
//     }
//   }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final following = ref.watch(runSynchronizeProvider(SynchronizeMode.following));
    final follower = ref.watch(runSynchronizeProvider(SynchronizeMode.follower));
    useEffect(
      () {
        _requestPermissionForAndroid();
        final timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
          final following = await ref.read(runSynchronizeProvider(SynchronizeMode.following).future);
          final follower = await ref.read(runSynchronizeProvider(SynchronizeMode.follower).future);
          final progress = following.progress + follower.progress;
          final length = following.length + follower.length;
          await FlutterForegroundTask.updateService(notificationTitle: '同期中... $progress/$length');
        });
        return timer.cancel;
      },
      const [],
    );

    return WillStartForegroundTask(
      onWillStart: () async {
        return true;
      },
      androidNotificationOptions: AndroidNotificationOptions(
        channelId: 'foreground_service',
        channelName: 'Foreground Service Notification',
        channelDescription: 'This notification appears when the foreground service is running.',
      ),
      iosNotificationOptions: const IOSNotificationOptions(),
      foregroundTaskOptions: const ForegroundTaskOptions(),
      notificationTitle: 'Foreground Service is running in the background',
      notificationText: 'Tap to return to the app ${DateTime.now()}',
      child: Scaffold(
        drawerEdgeDragWidth: MediaQuery.of(context).padding.left + 40,
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.synchronize)),
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
                    switch (messages.finish) {
                      true => Padding(
                          padding: const EdgeInsets.all(8),
                          child: SuccessLabel(
                            child: Text(
                              AppLocalizations.of(context)!.syncSuccess,
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      false => Padding(
                          padding: const EdgeInsets.all(8),
                          child: AlertLabel(
                            child: Text(
                              AppLocalizations.of(context)!.syncAlert,
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                    },
                    if (messages.wait != null) ...[
                      Text(AppLocalizations.of(context)!.apiLimit),
                      Text(AppLocalizations.of(context)!.apiLimitDetails(messages.wait!)),
                    ],
                  ],
                  Expanded(child: Container()),
                  switch ((following.finish, follower.finish)) {
                    (true, true) => ElevatedButton(
                        onPressed: () async {
                          await context.router.root.maybePop();
                        },
                        child: Text(AppLocalizations.of(context)!.close),
                      ),
                    (_, _) => ElevatedButton(
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
                        onPressed: () {
                          showDialog<void>(
                            context: context,
                            builder: (BuildContext context) => ConfirmDialog(
                              pop: false,
                              content: Text(AppLocalizations.of(context)!.syncCancelConfirm),
                              onPressed: () async {
                                Navigator.of(context).pop();
                                await context.router.replace(const HomeRoute());
                              },
                            ),
                          );
                        },
                        child: Text(AppLocalizations.of(context)!.cancel),
                      ),
                  },
                ],
              ),
            (AsyncLoading(:final error?, :final stackTrace?), _) => Column(
                children: [
                  for (final e in [error.toString(), stackTrace.toString()]) Text(e),
                ],
              ),
            (_, AsyncLoading(:final error?, :final stackTrace?)) => Column(
                children: [
                  for (final e in [error.toString(), stackTrace.toString()]) Text(e),
                ],
              ),
            _ => const Loading(),
          },
        ),
      ),
    );
  }
}
