// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_doge/component/physics.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:social_doge/view/drawer/drawer.dart';

final currentIndexProvider = StateProvider<CurrentIndex>((ref) => CurrentIndex.timeline);

enum CurrentIndex {
  timeline(icon: Icons.home),
  latestTimeline(icon: Icons.home),
  bbb(icon: Icons.home);

  Widget toWidget() {
    switch (this) {
      case CurrentIndex.timeline:
        return Container();
      // return const socialDogeTimeline();
      case CurrentIndex.latestTimeline:
        return Container();
      // return const socialDogeLatestTimeline();
      case CurrentIndex.bbb:
        return Container();
    }
  }

  String toLocalization(BuildContext context) {
    switch (this) {
      case CurrentIndex.timeline:
        return AppLocalizations.of(context)!.home;
      case CurrentIndex.latestTimeline:
        return AppLocalizations.of(context)!.home;
      case CurrentIndex.bbb:
        return AppLocalizations.of(context)!.home;
    }
  }

  final IconData icon;
  const CurrentIndex({required this.icon});
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
          children: [for (CurrentIndex scene in CurrentIndex.values) scene.toWidget()],
          onPageChanged: (int index) {
            WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
            ref.read(currentIndexProvider.notifier).state = CurrentIndex.values[index];
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          for (CurrentIndex scene in CurrentIndex.values) BottomNavigationBarItem(icon: Icon(scene.icon), label: scene.toLocalization(context)),
        ],
        currentIndex: currentIndex.index,
        onTap: (int index) => controller.jumpToPage(index),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
