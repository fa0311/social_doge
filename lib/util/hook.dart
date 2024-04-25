import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void useInit(void Function() effect) {
  useEffect(
    () {
      effect();
      return null;
    },
    [],
  );
}

void useListener(void Function() effect, void Function(void Function()) listener, void Function(void Function()) disposer) {
  useEffect(
    () {
      listener(effect);
      return () => disposer(effect);
    },
    [listener, disposer],
  );
}

class _RouteCallbacks with RouteAware {
  const _RouteCallbacks({
    this.handleDidPopNext,
    this.handleDidPush,
    this.handleDidPop,
    this.handleDidPushNext,
  });

  final VoidCallback? handleDidPopNext;
  final VoidCallback? handleDidPush;
  final VoidCallback? handleDidPop;
  final VoidCallback? handleDidPushNext;

  @override
  void didPopNext() {
    handleDidPopNext?.call();
  }

  @override
  void didPush() {
    handleDidPush?.call();
  }

  @override
  void didPop() {
    handleDidPop?.call();
  }

  @override
  void didPushNext() {
    handleDidPushNext?.call();
  }
}

void useRouteObserver(
  RouteObserver<ModalRoute<dynamic>> routeObserver, {
  VoidCallback? didPopNext,
  VoidCallback? didPush,
  VoidCallback? didPop,
  VoidCallback? didPushNext,
  List<Object?> keys = const [],
}) {
  final context = useContext();
  final route = ModalRoute.of(context);

  useEffect(
    () {
      if (route == null) {
        return null;
      }

      final callbacks = _RouteCallbacks(
        handleDidPop: didPop,
        handleDidPopNext: didPopNext,
        handleDidPush: didPush,
        handleDidPushNext: didPushNext,
      );
      routeObserver.subscribe(callbacks, route);
      return () => routeObserver.unsubscribe(callbacks);
    },
    [route, routeObserver, ...keys],
  );
}
