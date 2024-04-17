import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key, this.onResult});

  final void Function()? onResult;

  static Uri baseUrl = Uri.https('twitter.com', '/');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InAppWebView(
      initialUrlRequest: URLRequest(url: WebUri.uri(baseUrl)..resolve('login')),
      onTitleChanged: (controller, title) async {
        final url = await controller.getUrl();
        if (url != null && url.path == url.resolve('home').path && context.mounted) {
          onResult?.call();
        }
      },
    );
  }
}
