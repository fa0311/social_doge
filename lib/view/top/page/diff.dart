// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:social_doge/component/loading.dart';
import 'package:social_doge/view/sub/synchronized.dart';

part 'diff.g.dart';

@riverpod
Future<List<int>> getFollowerTime(GetFollowerTimeRef ref) async {
  final db = await ref.watch(getDatabaseProvider.future);
  final response = await db.query("user_followers", columns: ["time"], groupBy: "time", orderBy: "time ASC");

  return [for (final e in response) e["time"] as int];
}

@riverpod
Future<List<String>> getUnsubscribe(GetUnsubscribeRef ref, int count) async {
  final db = await ref.watch(getDatabaseProvider.future);
  final followerTime = await ref.watch(getFollowerTimeProvider.future);
  final time = followerTime[followerTime.length - count];
  final timeBefore = followerTime[followerTime.length - count - 1];
  final userList = (await db.query("user_followers", columns: ["twitter_id"], where: "time = ?", whereArgs: [time]));
  final userListBefore = (await db.query("user_followers", columns: ["twitter_id"], where: "time = ?", whereArgs: [timeBefore]));
  final userListId = userList.map((e) => e["twitter_id"] as String);
  final userListBeforeId = userListBefore.map((e) => e["twitter_id"] as String);
  return userListBeforeId.where((e) => !userListId.contains(e)).toList();
}

@riverpod
Future<UserDB> getUser(GetUserRef ref, String id) async {
  final db = await ref.read(getDatabaseProvider.future);
  final user = (await db.query("user", where: "twitter_id = ?", whereArgs: [id]))[0];
  return UserDB(
    twitterId: user["twitter_id"] as String,
    screenName: user["screen_name"] as String,
    name: user["name"] as String,
    description: user["description"] as String,
    profileImageUrl: user["profile_image_url"] as String,
    profileBannerUrl: user["profile_banner_url"] as String?,
  );
}

class SocialDogeUnsubscribe extends ConsumerWidget {
  const SocialDogeUnsubscribe({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final time = ref.watch(getFollowerTimeProvider);
    return time.when(
      data: (time) {
        return ListView.builder(
          itemCount: time.length - 1,
          itemBuilder: (context, i) {
            final unsubscribe = ref.watch(getUnsubscribeProvider(i + 1));
            return unsubscribe.when(
              data: (unsubscribe) {
                if (unsubscribe.isEmpty) return Container();
                final date = DateTime.fromMillisecondsSinceEpoch(time[time.length - i - 1], isUtc: true);
                return Column(
                  children: [
                    Text(DateFormat(AppLocalizations.of(context)!.dateFormat1).format(date).toString()),
                    for (final e in unsubscribe)
                      ref.watch(getUserProvider(e)).when(
                            data: (user) {
                              return ListTile(
                                leading: Image.network(user.profileImageUrl),
                                title: Text(user.name),
                                subtitle: Text(user.description),
                                trailing: Text(user.twitterId),
                              );
                            },
                            error: (error, stackTrace) => Column(children: [
                              for (final e in [error.toString(), stackTrace.toString()]) Text(e)
                            ]),
                            loading: () => const Loading(),
                          ),
                  ],
                );
              },
              error: (error, stackTrace) => Column(children: [
                for (final e in [error.toString(), stackTrace.toString()]) Text(e)
              ]),
              loading: () => const Loading(),
            );
          },
        );
      },
      error: (error, stackTrace) => Column(children: [
        for (final e in [error.toString(), stackTrace.toString()]) Text(e)
      ]),
      loading: () => const Loading(),
    );
  }
}
