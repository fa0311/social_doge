import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Loading extends HookConsumerWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      alignment: Alignment.topCenter,
      child: const Padding(padding: EdgeInsets.only(top: 40), child: CircularProgressIndicator()),
    );
  }
}

class LoadingIcon extends HookConsumerWidget {
  const LoadingIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Padding(
      padding: EdgeInsets.only(right: 2, top: 2),
      child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator()),
    );
  }
}
