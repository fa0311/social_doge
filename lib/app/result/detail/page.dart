import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:social_doge/app/router.dart';
import 'package:social_doge/component/part/loading.dart';
import 'package:social_doge/component/part/select_modal.dart';
import 'package:social_doge/component/widget/error_log_view.dart';
import 'package:social_doge/i18n/translations.g.dart';
import 'package:social_doge/infrastructure/database/data.dart';
import 'package:social_doge/provider/db/db.dart';
import 'package:social_doge/util/latin.dart';

@RoutePage()
class ResultDetailPage extends HookConsumerWidget {
  const ResultDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context).result.detail;
    final follower = ref.watch(getUserSyncStatusProvider(SynchronizeMode.follower));
    final following = ref.watch(getUserSyncStatusProvider(SynchronizeMode.following));
    final operator = useState<OperatorType>(OperatorType.intersection);
    final leftOperand = useState<SynchronizeMode>(SynchronizeMode.follower);
    final rightOperand = useState<SynchronizeMode>(SynchronizeMode.following);
    final leftTimeKey = useState<int>(0);
    final rightTimeKey = useState<int>(0);

    final labels = [
      (t.latinChar(context: LatinChar.A), leftOperand, leftTimeKey),
      (t.latinChar(context: LatinChar.B), rightOperand, rightTimeKey),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(t.title),
      ),
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
              return Column(
                children: [
                  for (final label in labels)
                    ...() {
                      final data = switch (label.$2.value) {
                        SynchronizeMode.follower => follower.reversed.toList(),
                        SynchronizeMode.following => following.reversed.toList(),
                      };

                      return [
                        Text(label.$1),
                        ListTile(
                          title: Text(t.data),
                          subtitle: Text(t.synchronizeMode(context: label.$2.value)),
                          onTap: () async {
                            SelectModalTile.builder(
                              context,
                              itemCount: SynchronizeMode.values.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(t.synchronizeMode(context: SynchronizeMode.values[index])),
                                  selected: index == label.$2.value.index,
                                  onTap: () {
                                    label.$2.value = SynchronizeMode.values[index];
                                    Navigator.pop(context);
                                  },
                                );
                              },
                            );
                          },
                        ),
                        ListTile(
                          title: Text(t.time),
                          subtitle: Text(DateFormat(t.date).format(data[label.$3.value].time)),
                          onTap: () async {
                            SelectModalTile.builder(
                              context,
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(DateFormat(t.date).format(data[index].time)),
                                  selected: index == label.$3.value,
                                  onTap: () {
                                    label.$3.value = index;
                                    Navigator.pop(context);
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ];
                    }(),
                  Text(t.operator),
                  ListTile(
                    title: Text(t.operator),
                    subtitle: Text('${t.latinChar(context: LatinChar.A)} ${t.operatorTypeMath(context: operator.value)} ${t.latinChar(context: LatinChar.B)}'),
                    onTap: () {
                      SelectModalTile.show(
                        context,
                        items: [
                          for (final name in OperatorType.values)
                            ListTile(
                              title: Text(t.operatorTypeText(context: name)),
                              selected: name == operator.value,
                              onTap: () {
                                operator.value = name;
                                Navigator.pop(context);
                              },
                            ),
                        ],
                      );
                    },
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.router.push(
                            UserListRoute(
                              leftOperand: leftOperand.value.name,
                              rightOperand: rightOperand.value.name,
                              leftTime: follower[leftTimeKey.value].time.millisecondsSinceEpoch,
                              rightTime: following[rightTimeKey.value].time.millisecondsSinceEpoch,
                              operator: operator.value.name,
                            ),
                          );
                        },
                        child: Text(t.search),
                      ),
                    ],
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
