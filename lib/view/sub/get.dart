// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_doge/component/future/button.dart';
import 'package:social_doge/infrastructure/social_doge_api/model/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:social_doge/provider/session.dart';
import 'package:social_doge/view/drawer/drawer.dart';

part 'get.g.dart';

@riverpod
Stream<TimelineAddEntry> getFollowers(GetFollowersRef ref) async* {
  final session = await ref.watch(loginSessionProvider.future);
  final users = await session.getFollowers(userId: "900282258736545792");
  final entry = users.expand((instruction) => instruction.maybeWhen(timelineAddEntry: (type, entries) => entries, orElse: () => <TimelineAddEntry>[]));
  for (final e in entry) {
    yield e;
  }
}

class SocialDogeSynchronize extends ConsumerWidget {
  const SocialDogeSynchronize({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(getFollowersProvider);
    return Scaffold(
      drawerEdgeDragWidth: MediaQuery.of(context).padding.left + 40,
      appBar: AppBar(
        title: const Text("AppLocalizations"),
      ),
      drawer: const NormalDrawer(),
      body: SafeArea(
        child: FutureButton(
          onPressed: () async {},
          child: const Text("AppLocalizations"),
        ),
      ),
    );
  }
}
