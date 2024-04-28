import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_doge/component/part/label.dart';
import 'package:social_doge/util/hook.dart';

@RoutePage()
class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key, this.onResult});

  final void Function(BuildContext context)? onResult;

  static Uri baseUrl = Uri.https('twitter.com', '/');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = useState(false);
    final snackBarController = useState<ScaffoldFeatureController<SnackBar, SnackBarClosedReason>?>(null);

    useInit(() {
      Future.delayed(const Duration(seconds: 2), () async {
        if (context.mounted) {
          const snackBar = SnackBar(
            backgroundColor: Colors.transparent,
            content: AlertLabel(
              child: Column(
                children: [
                  Text(
                    'ログインするアカウントと管理するアカウントは分けることが出来ます。',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    '不正な操作を疑われる可能性が高いため、サブアカウントでログインすることを推奨します。',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            duration: Duration(minutes: 1),
            margin: EdgeInsets.only(left: 23, right: 23, bottom: 23),
            behavior: SnackBarBehavior.floating,
          );
          snackBarController.value = ScaffoldMessenger.of(context).showSnackBar(snackBar);
          await snackBarController.value!.closed;
          snackBarController.value = null;
        }
      });
    });

    return Scaffold(
      appBar: AppBar(title: const Text('ログイン')),
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
