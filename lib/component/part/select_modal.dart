import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SelectModalTile extends StatelessWidget {
  const SelectModalTile({
    super.key,
    required this.itemBuilder,
    this.itemCount,
  });

  final Widget? Function(BuildContext, int) itemBuilder;
  final int? itemCount;

  static void show(
    BuildContext context, {
    required List<Widget> items,
    int? itemCount,
  }) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return SelectModalTile(
          itemCount: itemCount,
          itemBuilder: (context, index) => items.length > index ? items[index] : null,
        );
      },
    );
  }

  static void builder(
    BuildContext context, {
    required Widget? Function(BuildContext, int) itemBuilder,
    int? itemCount,
  }) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return SelectModalTile(
          itemCount: itemCount,
          itemBuilder: itemBuilder,
        );
      },
    );
  }

  static void consumer(
    BuildContext context, {
    required Widget Function(BuildContext, int, WidgetRef) builder,
    int? itemCount,
  }) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return SelectModalTile(
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return Consumer(
              builder: (context, ref, _) {
                return builder(context, index, ref);
              },
            );
          },
        );
      },
    );
  }

  static void state(
    BuildContext context, {
    required Widget Function(BuildContext, int, StateSetter) builder,
    int? itemCount,
    StateSetter? setState,
  }) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return SelectModalTile(
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return StatefulBuilder(
              builder: (context, setStateChild) {
                return builder(context, index, (void Function() x) {
                  setStateChild(x);
                  setState?.call(x);
                });
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      builder: (context, scrollController) {
        return ListView.builder(
          controller: scrollController,
          itemCount: itemCount,
          itemBuilder: itemBuilder,
        );
      },
    );
  }
}
