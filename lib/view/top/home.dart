// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:social_doge/component/physics.dart';
import 'package:social_doge/view/drawer/drawer.dart';
import 'package:social_doge/view/top/page/diff.dart';
import 'package:social_doge/view/top/page/main.dart';

part 'home.g.dart';

@riverpod
class CurrentIndex extends _$CurrentIndex {
  @override
  CurrentIndexEnum build() => CurrentIndexEnum.home;
  void update(CurrentIndexEnum method) => state = method;
}

class FollowersCount {
  FollowersCount(this.time, this.count);
  final int time;
  final int count;
}

enum CurrentIndexEnum {
  home(icon: Icons.home),
  latestTimeline(icon: Icons.home),
  bbb(icon: Icons.home);

  Widget toWidget() {
    switch (this) {
      case CurrentIndexEnum.home:
        return SocialDogeMain();
      case CurrentIndexEnum.latestTimeline:
        return const SocialDogeUnsubscribe();
      // return const socialDogeLatestTimeline();
      case CurrentIndexEnum.bbb:
        return Container();
    }
  }

  String toLocalization(BuildContext context) {
    switch (this) {
      case CurrentIndexEnum.home:
        return AppLocalizations.of(context)!.home;
      case CurrentIndexEnum.latestTimeline:
        return AppLocalizations.of(context)!.home;
      case CurrentIndexEnum.bbb:
        return AppLocalizations.of(context)!.home;
    }
  }

  final IconData icon;
  const CurrentIndexEnum({required this.icon});
}

class SocialDogeHome extends ConsumerWidget {
  const SocialDogeHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);
    final controller = PageController(initialPage: currentIndex.index);

    return Scaffold(
      drawerEdgeDragWidth: MediaQuery.of(context).padding.left + 40,
      appBar: AppBar(
        title: Text(currentIndex.toLocalization(context)),
      ),
      drawer: const NormalDrawer(),
      body: SafeArea(
        child: PageView(
          controller: controller,
          physics: const FastScrollPhysics(),
          children: [for (CurrentIndexEnum scene in CurrentIndexEnum.values) scene.toWidget()],
          onPageChanged: (int index) {
            WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
            ref.read(currentIndexProvider.notifier).update(CurrentIndexEnum.values[index]);
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [for (CurrentIndexEnum scene in CurrentIndexEnum.values) BottomNavigationBarItem(icon: Icon(scene.icon), label: scene.toLocalization(context))],
        currentIndex: currentIndex.index,
        onTap: (int index) => controller.jumpToPage(index),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
