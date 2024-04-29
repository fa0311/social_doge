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

  static void showHook(
    BuildContext context, {
    required List<Widget> Function(BuildContext) itemBuilder,
  }) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return HookConsumer(
          builder: (context, ref, _) {
            final data = itemBuilder(context);
            return SelectModalTile(
              itemCount: data.length,
              itemBuilder: (context, index) => data.length > index ? data[index] : null,
            );
          },
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

  static void consumerBuilder(
    BuildContext context, {
    required Widget Function(BuildContext, int, WidgetRef) builder,
    int? itemCount,
  }) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Consumer(
          builder: (context, ref, _) {
            return SelectModalTile(
              itemCount: itemCount,
              itemBuilder: (context, index) {
                return builder(context, index, ref);
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
