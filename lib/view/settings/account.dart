// Dart imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Account extends ConsumerWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAccountController = TextEditingController()..text = "aaaa";

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.account),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: userAccountController,
                decoration: const InputDecoration(
                  labelText: "account id",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
