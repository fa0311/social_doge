import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_doge/component/part/future/tile.dart';
import 'package:social_doge/component/part/loading.dart';
import 'package:social_doge/component/part/modal.dart';
import 'package:social_doge/component/part/twitter/user_profile.dart';
import 'package:social_doge/provider/db/db.dart';

@RoutePage()
class UnfollowPage extends HookConsumerWidget {
  const UnfollowPage({super.key, required this.count});
  final int count;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unsubscribe = ref.watch(getUnsubscribeProvider(count + 1));
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.unfollowedUsersList)),
      body: unsubscribe.when(
        data: (unsubscribe) {
          if (unsubscribe.isEmpty) {
            return Container();
          }
          return ListView.builder(
            itemBuilder: (context, i) {
              final user = ref.watch(getUserProvider(unsubscribe[i]));
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
            itemCount: unsubscribe.length,
          );
        },
        error: (error, stackTrace) => Column(
          children: [
            for (final e in [error.toString(), stackTrace.toString()]) Text(e),
          ],
        ),
        loading: () => const Loading(),
      ),
    );
  }
}
