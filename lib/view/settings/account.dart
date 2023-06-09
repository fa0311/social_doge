import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:social_doge/component/future/button.dart';
import 'package:social_doge/database/self_account.dart';
import 'package:social_doge/view/top/home.dart';
part 'account.g.dart';

@riverpod
TextEditingController accountController(AccountControllerRef ref) {
  return TextEditingController(text: ref.read(selfAccountProvider) ?? '');
}

class AccountSettings extends ConsumerWidget {
  const AccountSettings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = ref.watch(accountControllerProvider);
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
                  await ref.read(selfAccountProvider.notifier).update(textController.text);
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

class AccountSettingsScaffold extends ConsumerWidget {
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

class AccountSettingsWalkthrough extends ConsumerWidget {
  const AccountSettingsWalkthrough({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(selfAccountProvider, (previous, next) {
      if (next != null) {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute<void>(builder: (context) => const SocialDogeHome()), (_) => false);
      }
    });

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
