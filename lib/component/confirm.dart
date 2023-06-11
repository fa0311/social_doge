// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Project imports:
import 'package:social_doge/component/future/button.dart';

class ConfirmDialog extends StatefulWidget {
  final Widget? title;
  final Widget? content;
  final Function() onPressed;
  final bool pop;
  const ConfirmDialog({super.key, this.title, this.content, required this.onPressed, this.pop = true});

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
            if (widget.pop) Navigator.pop(context);
          },
          child: Text(AppLocalizations.of(context)!.ok),
        ),
      ],
    );
  }
}
