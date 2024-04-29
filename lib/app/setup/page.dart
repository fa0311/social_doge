import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_doge/component/part/future/button.dart';
import 'package:social_doge/i18n/translations.g.dart';
import 'package:social_doge/provider/twitter/account.dart';

@RoutePage()
class SetupPage extends HookConsumerWidget {
  const SetupPage({super.key, this.onResult});

  final void Function(BuildContext context)? onResult;

  static const twitterAccountPrefix = '@';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context).setup;
    final textController = useTextEditingController(text: ref.read(selfAccountProvider).valueOrNull ?? '');

    return Scaffold(
      appBar: AppBar(
        title: Text(t.title),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: textController,
                decoration: InputDecoration(
                  labelText: t.accountId,
                  prefixText: twitterAccountPrefix,
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  FutureButton(
                    type: ButtonType.elevatedButton,
                    onPressed: () async {
                      await ref.read(selfAccountProvider.notifier).set(textController.text);
                      if (context.mounted) {
                        onResult?.call(context);
                      }
                    },
                    child: Text(t.save),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
