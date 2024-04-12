import 'package:flutter/material.dart';

/// 選択肢を表示するモーダル
class SelectModalTile extends StatelessWidget {
  const SelectModalTile({
    super.key,
    required this.items,
  });

  /// 選択肢
  final List<Widget> items;

  /// 表示
  static void show(
    BuildContext context, {
    required List<Widget> items,
  }) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return SelectModalTile(
          items: items,
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
          itemCount: items.length,
          itemBuilder: (context, index) {
            return items[index];
          },
        );
      },
    );
  }
}
