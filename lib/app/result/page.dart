import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_doge/app/result/user/page.dart';
import 'package:social_doge/app/router.dart';
import 'package:social_doge/component/part/loading.dart';
import 'package:social_doge/component/widget/error_log_view.dart';
import 'package:social_doge/infrastructure/database/data.dart';
import 'package:social_doge/provider/db/db.dart';

@RoutePage()
class ResultPage extends HookConsumerWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final follower = ref.watch(getUserSyncStatusProvider(SynchronizeMode.follower));
    final following = ref.watch(getUserSyncStatusProvider(SynchronizeMode.following));

    // useListener(
    //   () => [
    //     ref.refresh(getUserSyncStatusProvider(SynchronizeMode.follower)),
    //     ref.refresh(getUserSyncStatusProvider(SynchronizeMode.following)),
    //   ],
    //   context.router.addListener,
    //   context.router.removeListener,
    // );

    return Scaffold(
      body: switch ((following, follower)) {
        (AsyncData(value: final following), AsyncData(value: final follower)) => () {
            if (follower.isEmpty || following.isEmpty) {
              return const Center(
                child: Text('Empty'),
              );
            } else {
              final labels = [
                ('フォロー', SynchronizeMode.following, SynchronizeMode.following, 0, 0, Operator.union),
                ('フォロワー', SynchronizeMode.follower, SynchronizeMode.follower, 0, 0, Operator.union),
                ('相互フォロー', SynchronizeMode.follower, SynchronizeMode.following, 0, 0, Operator.intersection),
                ('片思い', SynchronizeMode.following, SynchronizeMode.follower, 0, 0, Operator.difference),
                ('片思われ', SynchronizeMode.follower, SynchronizeMode.following, 0, 0, Operator.difference),
                ('新規フォロー', SynchronizeMode.following, SynchronizeMode.following, 0, 1, Operator.difference),
                ('新規フォロワー', SynchronizeMode.follower, SynchronizeMode.follower, 0, 1, Operator.difference),
                ('フォロー解除', SynchronizeMode.following, SynchronizeMode.following, 1, 0, Operator.difference),
                ('フォロワー解除', SynchronizeMode.follower, SynchronizeMode.follower, 1, 0, Operator.difference),
              ];

              return Column(
                children: [
                  for (final label in labels)
                    if (label.$4 < follower.length && label.$5 < following.length)
                      (() {
                        final leftTime = switch (label.$2) {
                          SynchronizeMode.follower => follower[follower.length - label.$4 - 1],
                          SynchronizeMode.following => following[following.length - label.$5 - 1],
                        };
                        final rightTime = switch (label.$3) {
                          SynchronizeMode.follower => follower[follower.length - label.$4 - 1],
                          SynchronizeMode.following => following[following.length - label.$5 - 1],
                        };
                        return ListTile(
                          title: Text(label.$1),
                          onTap: () {
                            context.router.push(
                              UserListRoute(
                                leftOperand: label.$2.name,
                                rightOperand: label.$3.name,
                                leftTime: leftTime.time.millisecondsSinceEpoch,
                                rightTime: rightTime.time.millisecondsSinceEpoch,
                                operator: label.$6.toOperatorType().name,
                              ),
                            );
                          },
                        );
                      })(),
                  ElevatedButton(
                    child: const Text('詳細設定'),
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
