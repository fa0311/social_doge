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
