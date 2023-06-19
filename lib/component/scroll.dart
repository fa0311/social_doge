import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScrollWidget extends ConsumerWidget {
  const ScrollWidget({
    super.key,
    required this.onRefresh,
    required this.child,
    this.notificationPredicate = defaultScrollNotificationPredicate,
  });
  final RefreshCallback onRefresh;
  final ScrollNotificationPredicate notificationPredicate;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      notificationPredicate: notificationPredicate,
      child: SizedBox.expand(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: const AlwaysScrollableScrollPhysics(),
          child: child,
        ),
      ),
    );
  }
}
