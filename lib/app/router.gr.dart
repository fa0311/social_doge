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
    AccessibilityRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccessibilityPage(),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomePage(key: args.key),
      );
    },
    InfoLicenseRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const InfoLicensePage(),
      );
    },
    InfoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const InfoPage(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginPage(
          key: args.key,
          onResult: args.onResult,
        ),
      );
    },
    ResultRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ResultPage(),
      );
    },
    SettingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingPage(),
      );
    },
    SetupRoute.name: (routeData) {
      final args = routeData.argsAs<SetupRouteArgs>(
          orElse: () => const SetupRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SetupPage(
          key: args.key,
          onResult: args.onResult,
        ),
      );
    },
    SocialDogeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SocialDogePage(),
      );
    },
    SynchronizeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SynchronizePage(),
      );
    },
    UnfollowRoute.name: (routeData) {
      final args = routeData.argsAs<UnfollowRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UnfollowPage(
          key: args.key,
          count: args.count,
        ),
      );
    },
  };
}

/// generated route for
/// [AccessibilityPage]
class AccessibilityRoute extends PageRouteInfo<void> {
  const AccessibilityRoute({List<PageRouteInfo>? children})
      : super(
          AccessibilityRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccessibilityRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<HomeRouteArgs> page = PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [InfoLicensePage]
class InfoLicenseRoute extends PageRouteInfo<void> {
  const InfoLicenseRoute({List<PageRouteInfo>? children})
      : super(
          InfoLicenseRoute.name,
          initialChildren: children,
        );

  static const String name = 'InfoLicenseRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [InfoPage]
class InfoRoute extends PageRouteInfo<void> {
  const InfoRoute({List<PageRouteInfo>? children})
      : super(
          InfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'InfoRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    void Function()? onResult,
    List<PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(
            key: key,
            onResult: onResult,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<LoginRouteArgs> page = PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    this.onResult,
  });

  final Key? key;

  final void Function()? onResult;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onResult: $onResult}';
  }
}

/// generated route for
/// [ResultPage]
class ResultRoute extends PageRouteInfo<void> {
  const ResultRoute({List<PageRouteInfo>? children})
      : super(
          ResultRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResultRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingPage]
class SettingRoute extends PageRouteInfo<void> {
  const SettingRoute({List<PageRouteInfo>? children})
      : super(
          SettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SetupPage]
class SetupRoute extends PageRouteInfo<SetupRouteArgs> {
  SetupRoute({
    Key? key,
    void Function()? onResult,
    List<PageRouteInfo>? children,
  }) : super(
          SetupRoute.name,
          args: SetupRouteArgs(
            key: key,
            onResult: onResult,
          ),
          initialChildren: children,
        );

  static const String name = 'SetupRoute';

  static const PageInfo<SetupRouteArgs> page = PageInfo<SetupRouteArgs>(name);
}

class SetupRouteArgs {
  const SetupRouteArgs({
    this.key,
    this.onResult,
  });

  final Key? key;

  final void Function()? onResult;

  @override
  String toString() {
    return 'SetupRouteArgs{key: $key, onResult: $onResult}';
  }
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

/// generated route for
/// [SynchronizePage]
class SynchronizeRoute extends PageRouteInfo<void> {
  const SynchronizeRoute({List<PageRouteInfo>? children})
      : super(
          SynchronizeRoute.name,
          initialChildren: children,
        );

  static const String name = 'SynchronizeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UnfollowPage]
class UnfollowRoute extends PageRouteInfo<UnfollowRouteArgs> {
  UnfollowRoute({
    Key? key,
    required int count,
    List<PageRouteInfo>? children,
  }) : super(
          UnfollowRoute.name,
          args: UnfollowRouteArgs(
            key: key,
            count: count,
          ),
          initialChildren: children,
        );

  static const String name = 'UnfollowRoute';

  static const PageInfo<UnfollowRouteArgs> page =
      PageInfo<UnfollowRouteArgs>(name);
}

class UnfollowRouteArgs {
  const UnfollowRouteArgs({
    this.key,
    required this.count,
  });

  final Key? key;

  final int count;

  @override
  String toString() {
    return 'UnfollowRouteArgs{key: $key, count: $count}';
  }
}
