import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_doge/app/router.dart';
import 'package:social_doge/component/drawer.dart';
import 'package:social_doge/component/part/physics.dart';
import 'package:social_doge/i18n/translations.g.dart';

@RoutePage()
class SocialDogePage extends HookConsumerWidget {
  const SocialDogePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final items = [
      BottomNavigationBarItem(label: t.home.title, icon: const Icon(Icons.home)),
      BottomNavigationBarItem(label: t.result.title, icon: const Icon(Icons.timeline)),
    ];

    return AutoTabsRouter.pageView(
      routes: const [
        HomeRoute(),
        ResultRoute(),
      ],
      physics: const FastScrollPhysics(),
      builder: (context, child, _) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(items.elementAt(tabsRouter.activeIndex).label!),
          ),
          drawer: const NormalDrawer(),
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: items,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
          ),
        );
      },
    );
  }
}
