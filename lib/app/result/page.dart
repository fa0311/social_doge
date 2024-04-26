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

    return Scaffold(
      body: switch ((following, follower)) {
        (AsyncData(value: final following), AsyncData(value: final follower)) => () {
            if (follower.isEmpty || following.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('同期データがありません', style: Theme.of(context).textTheme.titleLarge),
                    const Text('ホームの同期ボタンを押して同期してください'),
                  ],
                ),
              );
            } else {
              final labels = [
                ('フォロー', 'フォローしているユーザー', SynchronizeMode.following, SynchronizeMode.following, 0, 0, Operator.union),
                ('フォロワー', 'フォローされているユーザー', SynchronizeMode.follower, SynchronizeMode.follower, 0, 0, Operator.union),
                ('相互フォロー', 'フォローしていてフォローされているユーザー', SynchronizeMode.follower, SynchronizeMode.following, 0, 0, Operator.intersection),
                ('片思い', 'フォローしていてフォローされていないユーザー', SynchronizeMode.following, SynchronizeMode.follower, 0, 0, Operator.difference),
                ('片思われ', 'フォローしていなくてフォローされているユーザー', SynchronizeMode.follower, SynchronizeMode.following, 0, 0, Operator.difference),
                ('新規フォロー', '最近フォローしたユーザー', SynchronizeMode.following, SynchronizeMode.following, 0, 1, Operator.difference),
                ('新規フォロワー', '最近フォローされたユーザー', SynchronizeMode.follower, SynchronizeMode.follower, 0, 1, Operator.difference),
                ('フォロー解除', '最近フォロー解除したユーザー', SynchronizeMode.following, SynchronizeMode.following, 1, 0, Operator.difference),
                ('フォロワー解除', '最近フォロー解除されたユーザー', SynchronizeMode.follower, SynchronizeMode.follower, 1, 0, Operator.difference),
              ];

              return ListView(
                children: [
                  for (final label in labels)
                    if (label.$5 < follower.length && label.$6 < following.length)
                      (() {
                        final leftTime = switch (label.$3) {
                          SynchronizeMode.follower => follower[follower.length - label.$5 - 1],
                          SynchronizeMode.following => following[following.length - label.$6 - 1],
                        };
                        final rightTime = switch (label.$4) {
                          SynchronizeMode.follower => follower[follower.length - label.$5 - 1],
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
                                operator: label.$7.toOperatorType().name,
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
