import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class ConsumerAutoRouteGuard extends AutoRouteGuard {
  ConsumerAutoRouteGuard(this.ref);
  WidgetRef ref;

  @override
  void onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) {
    onConsumerNavigation(resolver, router, ref);
  }

  void onConsumerNavigation(NavigationResolver resolver, StackRouter router, WidgetRef ref);
}
