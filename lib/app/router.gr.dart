// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    SocialDogeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SocialDogePage(),
      );
    }
  };
}

/// generated route for
/// [SocialDogePage]
class SocialDogeRoute extends PageRouteInfo<void> {
  const SocialDogeRoute({List<PageRouteInfo>? children})
      : super(
          SocialDogeRoute.name,
          initialChildren: children,
        );

  static const String name = 'SocialDogeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
