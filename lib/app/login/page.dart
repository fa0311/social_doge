import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_doge/component/part/label.dart';
import 'package:social_doge/i18n/translations.g.dart';
import 'package:social_doge/util/hook.dart';

@RoutePage()
class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key, this.onResult});

  final void Function(BuildContext context)? onResult;

  static Uri baseUrl = Uri.https('twitter.com', '/');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context).login;
    final result = useState(false);
    final snackBarController = useState<ScaffoldFeatureController<SnackBar, SnackBarClosedReason>?>(null);

    useInit(() {
      Future.delayed(const Duration(seconds: 2), () async {
        if (context.mounted) {
          final t = Translations.of(context).login;
          final snackBar = SnackBar(
            backgroundColor: Colors.transparent,
            content: AlertLabel(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final n in t.note) Text(n, style: const TextStyle(color: Colors.black)),
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
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: WebUri.uri(baseUrl.resolve('login'))),
        onTitleChanged: (controller, title) async {
          final url = await controller.getUrl();
          if (url != null && url.path == url.resolve('home').path && context.mounted && !result.value) {
            result.value = true;
            snackBarController.value?.close();
            onResult?.call(context);
          }
        },
      ),
    );
  }
}
