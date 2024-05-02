import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_doge/app/router.dart';
import 'package:social_doge/component/part/loading.dart';
import 'package:social_doge/component/widget/error_log_view.dart';
import 'package:social_doge/i18n/translations.g.dart';
import 'package:social_doge/infrastructure/database/data.dart';
import 'package:social_doge/provider/db/db.dart';

@RoutePage()
class ResultPage extends HookConsumerWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context).result;
    final follower = ref.watch(getUserSyncStatusProvider(SynchronizeMode.follower));
    final following = ref.watch(getUserSyncStatusProvider(SynchronizeMode.following));

    return Scaffold(
      body: switch ((following, follower)) {
        (AsyncData(value: final following), AsyncData(value: final follower)) => () {
            if (follower.isEmpty || following.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(Translations.of(context).result.empty.title, style: Theme.of(context).textTheme.titleLarge),
                    Text(Translations.of(context).result.empty.description),
                  ],
                ),
              );
            } else {
              final labels = [
                (t.follow.title, t.follow.description, SynchronizeMode.following, SynchronizeMode.following, 0, 0, OperatorType.union),
                (t.follower.title, t.follower.description, SynchronizeMode.follower, SynchronizeMode.follower, 0, 0, OperatorType.union),
                (t.mutual.title, t.mutual.description, SynchronizeMode.follower, SynchronizeMode.following, 0, 0, OperatorType.intersection),
                (t.oneSide.title, t.oneSide.description, SynchronizeMode.following, SynchronizeMode.follower, 0, 0, OperatorType.difference),
                (t.oneSideReverse.title, t.oneSideReverse.description, SynchronizeMode.follower, SynchronizeMode.following, 0, 0, OperatorType.difference),
                (t.newFollow.title, t.newFollow.description, SynchronizeMode.following, SynchronizeMode.following, 0, 1, OperatorType.difference),
                (t.newFollower.title, t.newFollower.description, SynchronizeMode.follower, SynchronizeMode.follower, 0, 1, OperatorType.difference),
                (t.removeFollow.title, t.removeFollow.description, SynchronizeMode.following, SynchronizeMode.following, 1, 0, OperatorType.difference),
                (t.removeFollower.title, t.removeFollower.description, SynchronizeMode.follower, SynchronizeMode.follower, 1, 0, OperatorType.difference),
              ];

              return ListView(
                children: [
                  for (final label in labels)
                    if (label.$5 < follower.length && label.$6 < following.length)
                      (() {
                        final leftTime = switch (label.$3) {
                          SynchronizeMode.follower => follower[follower.length - label.$5 - 1],
                          SynchronizeMode.following => following[following.length - label.$5 - 1],
                        };
                        final rightTime = switch (label.$4) {
                          SynchronizeMode.follower => follower[follower.length - label.$6 - 1],
                          SynchronizeMode.following => following[following.length - label.$6 - 1],
                        };
                        return ListTile(
                          title: Text(label.$1),
                          subtitle: Text(label.$2),
                          onTap: () {
                            context.router.push(
                              UserListRoute(
                                leftOperand: label.$3.name,
                                rightOperand: label.$4.name,
                                leftTime: leftTime.time.millisecondsSinceEpoch,
                                rightTime: rightTime.time.millisecondsSinceEpoch,
                                operator: label.$7.name,
                              ),
                            );
                          },
                        );
                      })(),
                  ElevatedButton(
                    child: Text(t.detailConfig),
                    onPressed: () {
                      context.router.push(const ResultDetailRoute());
                    },
                  ),
                ],
              );
            }
          }(),
        (AsyncLoading(:final error?, :final stackTrace?), _) => ErrorLogView(error, stackTrace),
        (_, AsyncLoading(:final error?, :final stackTrace?)) => ErrorLogView(error, stackTrace),
        _ => const Loading(),
      },
    );
  }
}
