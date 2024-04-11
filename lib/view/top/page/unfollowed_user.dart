import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:social_doge/component/future/tile.dart';
import 'package:social_doge/component/loading.dart';
import 'package:social_doge/component/modal.dart';
import 'package:social_doge/component/twitter/user_profile.dart';
import 'package:social_doge/database/data.dart';
import 'package:social_doge/database/provider.dart';
import 'package:social_doge/database/self_account.dart';

part 'unfollowed_user.g.dart';

@riverpod
Future<List<DateTime>> getFollowerTime(GetFollowerTimeRef ref) async {
  final userId = ref.watch(selfAccountProvider.notifier).id;
  final db = ref.read(getDatabaseProvider);
  final response = await db.followersTime(userId: userId);
  return response;
}

@riverpod
Future<List<String>> getUnsubscribe(GetUnsubscribeRef ref, int count) async {
  final db = ref.read(getDatabaseProvider);
  final followerTime = await ref.watch(getFollowerTimeProvider.future);
  final userId = ref.watch(selfAccountProvider.notifier).id;
  final time = followerTime[followerTime.length - count];
  final timeBefore = followerTime[followerTime.length - count - 1];

  final userList = await db.followers(userId: userId, time: time);
  final userListBefore = await db.followers(userId: userId, time: timeBefore);

  return userListBefore.where(userList.contains).toList();
}

@riverpod
Future<UserTableData> getUser(GetUserRef ref, String id) async {
  final db = ref.read(getDatabaseProvider);
  final response = await db.user(userId: id);
  return response;
}

class SocialDogeUnsubscribe extends HookConsumerWidget {
  const SocialDogeUnsubscribe({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final time = ref.watch(getFollowerTimeProvider);
    return time.when(
      data: (time) {
        if (time.length < 2) {
          return Center(child: Text(AppLocalizations.of(context)!.noData));
        }
        return ListView.builder(
          itemBuilder: (context, i) {
            final date = time[time.length - i - 1];
            return ListTile(
              title: Text(DateFormat(AppLocalizations.of(context)!.dateFormat1).format(date)),
              onTap: () {
                Navigator.push(context, MaterialPageRoute<void>(builder: (context) => SocialDogeUnsubscribeDetail(count: i)));
              },
            );
          },
          itemCount: time.length - 1,
        );
      },
      error: (error, stackTrace) => Column(
        children: [
          for (final e in [error.toString(), stackTrace.toString()]) Text(e),
        ],
      ),
      loading: () => const Loading(),
    );
  }
}

class SocialDogeUnsubscribeDetail extends HookConsumerWidget {
  const SocialDogeUnsubscribeDetail({super.key, required this.count});
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
