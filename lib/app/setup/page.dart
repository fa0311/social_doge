import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_doge/component/part/future/button.dart';
import 'package:social_doge/component/part/label.dart';
import 'package:social_doge/i18n/translations.g.dart';
import 'package:social_doge/provider/twitter/account.dart';
import 'package:social_doge/util/hook.dart';

@RoutePage()
class SetupPage extends HookConsumerWidget {
  const SetupPage({super.key, this.onResult});

  final void Function(BuildContext context)? onResult;

  static const twitterAccountPrefix = '@';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context).setup;
    final textController = useTextEditingController(text: ref.read(selfAccountProvider).valueOrNull ?? '');
    final snackBarController = useState<ScaffoldFeatureController<SnackBar, SnackBarClosedReason>?>(null);

    useInit(() {
      Future.delayed(const Duration(seconds: 2), () async {
        if (context.mounted) {
          final t = Translations.of(context).setup;
          final snackBar = SnackBar(
            backgroundColor: Colors.transparent,
            content: AlertLabel(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final n in t.description) Text(n, style: const TextStyle(color: Colors.black)),
                ],
              ),
            ),
            duration: const Duration(minutes: 1),
            margin: const EdgeInsets.only(left: 23, right: 23, bottom: 23),
            behavior: SnackBarBehavior.floating,
            elevation: 0,
          );
          snackBarController.value = ScaffoldMessenger.of(context).showSnackBar(snackBar);
          await snackBarController.value!.closed;
          if (context.mounted) {
            snackBarController.value = null;
          }
        }
      });
    });

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
                  hintText: t.accountHint,
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
                      snackBarController.value?.close();
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
