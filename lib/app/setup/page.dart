import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_doge/component/part/future/button.dart';
import 'package:social_doge/infrastructure/database/self_account.dart';

@RoutePage()
class SetupPage extends HookConsumerWidget {
  const SetupPage({super.key, this.onResult});

  final void Function()? onResult;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController(text: ref.read(selfAccountProvider).valueOrNull ?? '');

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.account),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: textController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.accountId,
                  prefixText: AppLocalizations.of(context)!.twitterAccountPrefix,
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  FutureButton(
                    type: ButtonType.elevatedButton,
                    onPressed: () async {
                      await ref.read(selfAccountProvider.notifier).set(textController.text);
                      onResult?.call();
                    },
                    child: Text(AppLocalizations.of(context)!.save),
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
