import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_doge/app/accessibility/page.dart';
import 'package:social_doge/app/guard.dart';
import 'package:social_doge/app/help/license/page.dart';
import 'package:social_doge/app/help/page.dart';
import 'package:social_doge/app/home/page.dart';
import 'package:social_doge/app/login/page.dart';
import 'package:social_doge/app/page.dart';
import 'package:social_doge/app/result/detail/page.dart';
import 'package:social_doge/app/result/page.dart';
import 'package:social_doge/app/result/remove/page.dart';
import 'package:social_doge/app/result/user/page.dart';
import 'package:social_doge/app/setting/page.dart';
import 'package:social_doge/app/setup/page.dart';
import 'package:social_doge/app/synchronize/page.dart';
import 'package:social_doge/constant/config.dart';
import 'package:social_doge/provider/guard.dart';
import 'package:social_doge/provider/package_info.dart';
import 'package:social_doge/provider/twitter/account.dart';
import 'package:url_launcher/url_launcher.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  AppRouter(this.ref);
  WidgetRef ref;

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: SocialDogeRoute.page,
          initial: true,
          guards: [LoginGuard(ref), SetupGuard(ref), UpdateGuard(ref)],
          children: [
            AutoRoute(path: 'home', page: HomeRoute.page),
            AutoRoute(path: 'result', page: ResultRoute.page),
          ],
        ),
        AutoRoute(path: '/synchronize', page: SynchronizeRoute.page),
        AutoRoute(path: '/result/user', page: UserListRoute.page),
        AutoRoute(path: '/result/detail', page: ResultDetailRoute.page),
        AutoRoute(path: '/result/remove', page: ResultRemoveRoute.page),
        AutoRoute(path: '/accessibility', page: AccessibilityRoute.page),
        AutoRoute(path: '/login', page: LoginRoute.page),
        AutoRoute(path: '/setup', page: SetupRoute.page),
        AutoRoute(path: '/info', page: HelpRoute.page),
        AutoRoute(path: '/info/license', page: InfoLicenseRoute.page),
        AutoRoute(path: '/setting', page: SettingRoute.page),
      ];
}

class SetupGuard extends ConsumerAutoRouteGuard {
  SetupGuard(super.ref);

  @override
  Future<void> onConsumerNavigation(NavigationResolver resolver, StackRouter router, WidgetRef ref) async {
    if (await ref.read(selfAccountProvider.future) == null) {
      await resolver.redirect(
        SetupRoute(
          onResult: (context) {
            resolver.next();
          },
        ),
      );
    } else {
      resolver.next();
    }
  }
}

class LoginGuard extends ConsumerAutoRouteGuard {
  LoginGuard(super.ref);

  @override
  Future<void> onConsumerNavigation(NavigationResolver resolver, StackRouter router, WidgetRef ref) async {
    if (ref.read(lastGuardProvider(GuardType.loginGuard).notifier).isExpired(const Duration(days: 1))) {
      await resolver.redirect(
        LoginRoute(
          onResult: (context) {
            ref.read(lastGuardProvider(GuardType.loginGuard).notifier).refresh();
            resolver.next();
          },
        ),
      );
    } else {
      resolver.next();
    }
  }
}

class UpdateGuard extends ConsumerAutoRouteGuard {
  UpdateGuard(super.ref);

  @override
  Future<void> onConsumerNavigation(NavigationResolver resolver, StackRouter router, WidgetRef ref) async {
    resolver.next();

    if (ref.read(lastGuardProvider(GuardType.updateGuard).notifier).isExpired(const Duration(days: 1))) {
      final latestVersion = await ref.read(latestAppVersionProvider.future);
      final packageVersion = await ref.read(packageVersionProvider.future);

      if (latestVersion != packageVersion.version) {
        while (router.navigatorKey.currentContext == null) {
          await Future<void>.delayed(const Duration(seconds: 1));
        }
        final context = router.navigatorKey.currentContext!;
        if (context.mounted) {
          ref.read(lastGuardProvider(GuardType.updateGuard).notifier).refresh();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('アプリのアップデートがあります'),
              action: SnackBarAction(
                label: '確認',
                onPressed: () async {
                  if (await canLaunchUrl(Config.release)) {
                    await launchUrl(Config.release, mode: LaunchMode.externalApplication);
                  }
                },
              ),
            ),
          );
        }
      }
    }
  }
}
