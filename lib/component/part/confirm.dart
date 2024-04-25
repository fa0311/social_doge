import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:social_doge/component/part/future/button.dart';

class ConfirmDialog extends StatefulWidget {
  const ConfirmDialog({super.key, this.title, this.content, required this.onPressed, this.pop = true});
  final Widget? title;
  final Widget? content;
  final FutureOr<void> Function() onPressed;
  final bool pop;

  @override
  ConfirmDialogState createState() => ConfirmDialogState();
}

class ConfirmDialogState extends State<ConfirmDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: widget.title ?? Text(AppLocalizations.of(context)!.confirm),
      content: widget.content,
      actions: [
        FutureButton(
          onPressed: () async {
            await widget.onPressed();
            if (widget.pop && context.mounted) {
              Navigator.pop(context);
            }
          },
          child: Text(AppLocalizations.of(context)!.ok),
        ),
      ],
    );
  }
}
