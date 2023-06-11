// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:social_doge/component/loading.dart';
import 'package:social_doge/database/core.dart';
import 'package:social_doge/database/user.dart';
import 'package:url_launcher/url_launcher.dart';

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
  final user = await db.query("user", where: "twitter_id = ?", whereArgs: [id]);
  return UserDB.fromQuery(user.first);
}

class SocialDogeUnsubscribe extends ConsumerWidget {
  const SocialDogeUnsubscribe({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final time = ref.watch(getFollowerTimeProvider);
    return time.when(
      data: (time) {
        if (time.length < 2) return Center(child: Text(AppLocalizations.of(context)!.noData));
        return ListView.builder(
          itemBuilder: (context, i) {
            final date = DateTime.fromMillisecondsSinceEpoch(time[time.length - i - 1], isUtc: true);
            return ListTile(
              title: Text(DateFormat(AppLocalizations.of(context)!.dateFormat1).format(date).toString()),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SocialDogeUnsubscribeDetail(count: i)));
              },
            );
          },
          itemCount: time.length - 1,
        );
      },
      error: (error, stackTrace) => Column(children: [
        for (final e in [error.toString(), stackTrace.toString()]) Text(e)
      ]),
      loading: () => const Loading(),
    );
  }
}

class SocialDogeUnsubscribeDetail extends ConsumerWidget {
  final int count;
  const SocialDogeUnsubscribeDetail({super.key, required this.count});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unsubscribe = ref.watch(getUnsubscribeProvider(count + 1));
    return Scaffold(
      appBar: AppBar(title: const Text('Diff')),
      body: unsubscribe.when(
        data: (unsubscribe) {
          if (unsubscribe.isEmpty) return Container();
          return ListView.builder(
            itemBuilder: (context, i) {
              return ref.watch(getUserProvider(unsubscribe[i])).when(
                    data: (user) {
                      return ListTile(
                        leading: Image.network(user.profileImageUrl),
                        title: Text(user.name),
                        subtitle: Text(user.description, maxLines: 3, overflow: TextOverflow.ellipsis),
                        trailing: Text(user.screenName),
                        onTap: () async {
                          final url = Uri.https("twitter.com", user.screenName);
                          if (await canLaunchUrl(url)) {
                            launchUrl(url, mode: LaunchMode.externalApplication);
                          }
                        },
                      );
                    },
                    error: (error, stackTrace) => Column(children: [
                      for (final e in [error.toString(), stackTrace.toString()]) Text(e)
                    ]),
                    loading: () => const Loading(),
                  );
            },
            itemCount: unsubscribe.length,
          );
        },
        error: (error, stackTrace) => Column(children: [
          for (final e in [error.toString(), stackTrace.toString()]) Text(e)
        ]),
        loading: () => const Loading(),
      ),
    );
  }
}
