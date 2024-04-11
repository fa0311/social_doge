import 'package:auto_route/auto_route.dart';
import 'package:social_doge/app/page.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/', page: SocialDogeRoute.page, initial: true),
      ];
}
