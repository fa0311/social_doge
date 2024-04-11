import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:social_doge/component/physics.dart';
import 'package:social_doge/view/drawer/drawer.dart';
import 'package:social_doge/view/top/page/main.dart';
import 'package:social_doge/view/top/page/unfollowed_user.dart';

part 'page.g.dart';

@Riverpod(keepAlive: true)
class CurrentIndex extends _$CurrentIndex {
  @override
  CurrentIndexEnum build() => CurrentIndexEnum.home;
  set update(CurrentIndexEnum method) => state = method;
  CurrentIndexEnum get update => state;
}

enum CurrentIndexEnum {
  home(icon: Icons.home),
  unfollowedBy(icon: Icons.person_remove);

  const CurrentIndexEnum({required this.icon});

  Widget toWidget() {
    switch (this) {
      case CurrentIndexEnum.home:
        return SocialDogeMain();
      case CurrentIndexEnum.unfollowedBy:
        return const SocialDogeUnsubscribe();
    }
  }

  String toLocalization(BuildContext context) {
    switch (this) {
      case CurrentIndexEnum.home:
        return AppLocalizations.of(context)!.home;
      case CurrentIndexEnum.unfollowedBy:
        return AppLocalizations.of(context)!.unfollowed;
    }
  }

  final IconData icon;
}

@RoutePage()
class SocialDogePage extends HookConsumerWidget {
  const SocialDogePage({super.key});

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
          children: [for (final CurrentIndexEnum scene in CurrentIndexEnum.values) scene.toWidget()],
          onPageChanged: (int index) {
            WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
            ref.read(currentIndexProvider.notifier).update = CurrentIndexEnum.values[index];
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          for (final CurrentIndexEnum scene in CurrentIndexEnum.values) BottomNavigationBarItem(icon: Icon(scene.icon), label: scene.toLocalization(context)),
        ],
        currentIndex: currentIndex.index,
        onTap: controller.jumpToPage,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
