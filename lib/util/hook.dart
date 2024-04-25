import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void useInit(void Function() effect) {
  use(_InitHook(effect));
}

class _InitHook extends Hook<void> {
  const _InitHook(this.effect) : super(keys: null);

  final void Function() effect;

  @override
  _InitHookState createState() => _InitHookState();
}

class _InitHookState extends HookState<void, _InitHook> {
  @override
  void initHook() {
    super.initHook();
    hook.effect();
  }

  @override
  void build(BuildContext context) {}

  @override
  String get debugLabel => 'useInit';

  @override
  bool get debugSkipValue => true;
}

void useListener(void Function() effect, void Function(void Function()) listener, void Function(void Function()) disposer) {
  use(_ListenerHook(effect, listener, disposer));
}

class _ListenerHook extends Hook<void> {
  const _ListenerHook(this.effect, this.listener, this.disposer) : super(keys: const []);

  final void Function() effect;
  final void Function(void Function()) listener;
  final void Function(void Function()) disposer;

  @override
  _ListenerHookState createState() => _ListenerHookState();
}

class _ListenerHookState extends HookState<void, _ListenerHook> {
  @override
  void initHook() {
    super.initHook();
    hook.listener(hook.effect);
  }

  @override
  void build(BuildContext context) {}

  @override
  void dispose() => hook.disposer(hook.effect);

  @override
  String get debugLabel => 'useListener';

  @override
  bool get debugSkipValue => true;
}
