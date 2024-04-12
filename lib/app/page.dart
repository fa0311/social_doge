import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_doge/component/drawer.dart';
import 'package:social_doge/component/part/physics.dart';
import 'package:social_doge/view/top/page/main.dart';
import 'package:social_doge/view/top/page/unfollowed_user.dart';

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
    final currentIndex = useState(CurrentIndexEnum.home);
    final controller = PageController(initialPage: currentIndex.value.index);

    return Scaffold(
      drawerEdgeDragWidth: MediaQuery.of(context).padding.left + 40,
      appBar: AppBar(
        title: Text(currentIndex.value.toLocalization(context)),
      ),
      drawer: const NormalDrawer(),
      body: SafeArea(
        child: PageView(
          controller: controller,
          physics: const FastScrollPhysics(),
          children: [for (final CurrentIndexEnum scene in CurrentIndexEnum.values) scene.toWidget()],
          onPageChanged: (int index) {
            WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
            currentIndex.value = CurrentIndexEnum.values[index];
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          for (final CurrentIndexEnum scene in CurrentIndexEnum.values) BottomNavigationBarItem(icon: Icon(scene.icon), label: scene.toLocalization(context)),
        ],
        currentIndex: currentIndex.value.index,
        onTap: controller.jumpToPage,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
