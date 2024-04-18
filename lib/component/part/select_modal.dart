import 'package:flutter/material.dart';

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
