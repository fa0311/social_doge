import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_doge/app/router.dart';
import 'package:social_doge/component/drawer.dart';
import 'package:social_doge/component/part/physics.dart';

@RoutePage()
class SocialDogePage extends HookConsumerWidget {
  const SocialDogePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = [
      const BottomNavigationBarItem(label: 'aa', icon: Icon(Icons.home)),
      const BottomNavigationBarItem(label: 'bb', icon: Icon(Icons.timeline)),
    ];

    return AutoTabsRouter.pageView(
      routes: [
        HomeRoute(),
        const ResultRoute(),
      ],
      physics: const FastScrollPhysics(),
      builder: (context, child, _) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(tabsRouter.current.name),
            leading: const AutoLeadingButton(),
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
