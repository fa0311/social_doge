import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:social_doge/app/router.dart';
import 'package:social_doge/component/part/loading.dart';
import 'package:social_doge/component/part/select_modal.dart';
import 'package:social_doge/infrastructure/database/data.dart';
import 'package:social_doge/provider/db/db.dart';

enum Operator {
  intersection('∩'),
  union('∪'),
  difference('-'),
  symmetricDifference('△');

  const Operator(this.symbol);
  final String symbol;

  OperatorType toOperatorType() {
    switch (this) {
      case Operator.intersection:
        return OperatorType.intersection;
      case Operator.union:
        return OperatorType.union;
      case Operator.difference:
        return OperatorType.difference;
      case Operator.symmetricDifference:
        return OperatorType.symmetricDifference;
    }
  }
}

enum Latin {
  A('𝐴'),
  B('𝐵');

  const Latin(this.symbol);
  final String symbol;
}

@RoutePage()
class ResultPage extends HookConsumerWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final follower = ref.watch(getUserSyncStatusProvider(SynchronizeMode.follower));
    final following = ref.watch(getUserSyncStatusProvider(SynchronizeMode.following));
    final operator = useState<Operator>(Operator.intersection);
    final leftOperand = useState<SynchronizeMode>(SynchronizeMode.follower);
    final rightOperand = useState<SynchronizeMode>(SynchronizeMode.following);
    final leftTimeKey = useState<int>(0);
    final rightTimeKey = useState<int>(0);

    final labels = [
      (Latin.A, leftOperand, leftTimeKey),
      (Latin.B, rightOperand, rightTimeKey),
    ];

    return Scaffold(
      body: switch ((following, follower)) {
        (AsyncData(value: final following), AsyncData(value: final follower)) => () {
            if (follower.isEmpty || following.isEmpty) {
              return const Center(
                child: Text('Empty'),
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
                        Text(label.$1.symbol),
                        ListTile(
                          title: const Text('Data'),
                          subtitle: Text(label.$2.value.name),
                          onTap: () async {
                            SelectModalTile.builder(
                              context,
                              itemCount: SynchronizeMode.values.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(SynchronizeMode.values[index].name),
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
                          title: const Text('Time'),
                          subtitle: Text(DateFormat(AppLocalizations.of(context)!.dateFormat1).format(data[label.$3.value].time)),
                          onTap: () async {
                            SelectModalTile.builder(
                              context,
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(DateFormat(AppLocalizations.of(context)!.dateFormat1).format(data[index].time)),
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
                  const Text('operator'),
                  ListTile(
                    title: const Text('Operator'),
                    subtitle: Text('${Latin.A.symbol} ${operator.value.symbol} ${Latin.B.symbol}'),
                    onTap: () {
                      SelectModalTile.show(
                        context,
                        items: [
                          for (final name in Operator.values)
                            ListTile(
                              title: Text(name.name),
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
                              operator: operator.value.toOperatorType().name,
                            ),
                          );
                        },
                        child: const Text('Diff'),
                      ),
                    ],
                  ),
                ],
              );
            }
          }(),
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
    );
  }
}
