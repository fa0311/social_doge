import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_doge/component/part/future/tile.dart';
import 'package:social_doge/component/part/loading.dart';
import 'package:social_doge/component/part/modal.dart';
import 'package:social_doge/component/part/twitter/user_profile.dart';
import 'package:social_doge/infrastructure/database/data.dart';
import 'package:social_doge/provider/db/db.dart';
import 'package:social_doge/util/enum.dart';

@RoutePage()
class UserListPage extends HookConsumerWidget {
  const UserListPage({
    super.key,
    @QueryParam() this.leftOperand = '',
    @QueryParam() this.rightOperand = '',
    @QueryParam() this.leftTime = 0,
    @QueryParam() this.rightTime = 0,
    @QueryParam() this.operator = '',
  });
  final String leftOperand;
  final String rightOperand;
  final int leftTime;
  final int rightTime;
  final String operator;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(
      getUserDiffProvider(
        SynchronizeMode.values.bySafeName(leftOperand),
        SynchronizeMode.values.bySafeName(rightOperand),
        DateTime.fromMillisecondsSinceEpoch(leftTime),
        DateTime.fromMillisecondsSinceEpoch(rightTime),
        OperatorType.values.bySafeName(operator),
      ),
    );
    return Scaffold(
      appBar: AppBar(title: const Text('差分')),
      body: data.when(
        data: (data) => ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final user = ref.watch(getUserStateProvider(data.elementAt(index)));

            return user.when(
              data: (user) {
                return FutureTile(
                  leading: Image.network(user.profileImageUrl),
                  title: Text(user.name),
                  subtitle: Text(user.description, maxLines: 3, overflow: TextOverflow.ellipsis),
                  trailing: Text(user.screenName),
                  onTap: () async {
                    await showModalBottomSheetStatelessWidget<void>(
                      context: context,
                      builder: () {
                        return UserProfile(user: user);
                      },
                    );
                  },
                );
              },
              error: (error, stackTrace) => Column(
                children: [
                  for (final e in [error.toString(), stackTrace.toString()]) Text(e),
                ],
              ),
              loading: () => const Loading(),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Text(error.toString()),
        ),
      ),
    );
  }
}
