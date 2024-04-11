import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_doge/component/future/button.dart';
import 'package:social_doge/infrastructure/database/self_account.dart';

class AccountSettings extends HookConsumerWidget {
  const AccountSettings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController(text: ref.read(selfAccountProvider).valueOrNull ?? '');
    return Padding(
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
                },
                child: Text(AppLocalizations.of(context)!.save),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AccountSettingsScaffold extends HookConsumerWidget {
  const AccountSettingsScaffold({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.account),
      ),
      body: const SafeArea(
        child: AccountSettings(),
      ),
    );
  }
}

class AccountSettingsWalkthrough extends HookConsumerWidget {
  const AccountSettingsWalkthrough({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.listen(selfAccountProvider, (previous, next) {
    //   if (next != null) {
    //     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute<void>(builder: (context) => const SocialDogeHome()), (_) => false);
    //   }
    // });

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.account),
      ),
      body: const SafeArea(
        child: AccountSettings(),
      ),
    );
  }
}
