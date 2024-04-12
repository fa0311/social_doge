import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_doge/app/accessibility/page.dart';
import 'package:social_doge/app/guard.dart';
import 'package:social_doge/app/info/license/page.dart';
import 'package:social_doge/app/info/page.dart';
import 'package:social_doge/app/page.dart';
import 'package:social_doge/app/setup/page.dart';
import 'package:social_doge/app/synchronized/page.dart';
import 'package:social_doge/infrastructure/database/self_account.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  AppRouter(this.ref);
  WidgetRef ref;

  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/', page: SocialDogeRoute.page, initial: true, guards: [AuthGuard(ref)]),
        AutoRoute(path: '/accessibility', page: AccessibilityRoute.page),
        AutoRoute(path: '/setup', page: SetupRoute.page),
        AutoRoute(path: '/info', page: InfoRoute.page),
        AutoRoute(path: '/info/license', page: InfoLicenseRoute.page),
      ];
}

class AuthGuard extends ConsumerAutoRouteGuard {
  AuthGuard(super.ref);

  @override
  Future<void> onConsumerNavigation(NavigationResolver resolver, StackRouter router, WidgetRef ref) async {
    final selfAccount = await ref.read(selfAccountProvider.future);
    if (selfAccount == null) {
      await resolver.redirect(
        SetupRoute(
          onResult: () {
            resolver.next();
          },
        ),
      );
    } else {
      resolver.next();
    }
  }
}
