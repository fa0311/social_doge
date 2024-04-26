import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_doge/component/part/loading.dart';
import 'package:social_doge/component/part/select_modal.dart';
import 'package:social_doge/component/widget/error_log_view.dart';
import 'package:social_doge/infrastructure/database/data.dart';
import 'package:social_doge/provider/db/db.dart';
import 'package:social_doge/provider/twitter/account.dart';

@RoutePage()
class ResultRemovePage extends HookConsumerWidget {
  const ResultRemovePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final follower = ref.watch(getUserSyncStatusProvider(SynchronizeMode.follower));
    final following = ref.watch(getUserSyncStatusProvider(SynchronizeMode.following));
    final filterType = useState<SynchronizeMode?>(null);
    final checked = useState<List<(SynchronizeMode, SyncStatusData)>>([]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('同期データ削除'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              SelectModalTile.showHook(
                context,
                itemBuilder: (context) {
                  final labels = [
                    ('全て', null),
                    ('フォロワー', SynchronizeMode.follower),
                    ('フォロー中', SynchronizeMode.following),
                  ];
                  return [
                    for (final label in labels)
                      ListTile(
                        title: Text(label.$1),
                        selected: filterType.value == label.$2,
                        onTap: () {
                          filterType.value = label.$2;
                          Navigator.pop(context);
                        },
                      ),
                  ];
                },
              );
            },
          ),
        ],
      ),
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
              final data = [
                if (filterType.value != SynchronizeMode.following) ...follower.map((e) => (SynchronizeMode.follower, e)),
                if (filterType.value != SynchronizeMode.follower) ...following.map((e) => (SynchronizeMode.following, e)),
              ].sorted((a, b) => a.$2.time.compareTo(b.$2.time));

              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];
                  return ListTile(
                    title: Text(item.$1.name),
                    subtitle: Text('${item.$2.time} に同期 / ${item.$2.count} 件'),
                    trailing: checked.value.contains(item) ? const Icon(Icons.check_box) : const Icon(Icons.check_box_outline_blank),
                    onTap: () {
                      if (checked.value.contains(item)) {
                        checked.value = checked.value.where((e) => e != item).toList();
                      } else {
                        checked.value = [...checked.value, item];
                      }
                    },
                  );
                },
              );
            }
          }(),
        (AsyncLoading(:final error?, :final stackTrace?), _) => ErrorLogView(error, stackTrace),
        (_, AsyncLoading(:final error?, :final stackTrace?)) => ErrorLogView(error, stackTrace),
        _ => const Loading(),
      },
      floatingActionButton: switch (checked.value.isEmpty) {
        true => null,
        false => FloatingActionButton(
            child: const Icon(Icons.delete),
            onPressed: () async {
              final userId = await ref.read(getSelfAccountProvider.future);
              final db = ref.read(getDatabaseProvider);
              for (final item in checked.value) {
                await db.removeUserSyncStatus(userId: userId.restId, mode: item.$1, time: item.$2.time);
              }
              // ignore: unused_result
              await ref.refresh(getUserSyncStatusProvider(SynchronizeMode.follower).future);
              // ignore: unused_result
              await ref.refresh(getUserSyncStatusProvider(SynchronizeMode.following).future);
              checked.value = [];
            },
          ),
      },
    );
  }
}