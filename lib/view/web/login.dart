// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:social_doge/view/top/home.dart';

class TwitterLogin extends ConsumerWidget {
  static Uri url = Uri.https("twitter.com", "/");

  const TwitterLogin({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InAppWebView(
      initialUrlRequest: URLRequest(url: url.resolve("login")),
      onTitleChanged: (controller, title) async {
        final url = await controller.getUrl();
        if (url == null) return;
        if (url.path == url.resolve("home").path) {
          if (!context.mounted) return;
          Navigator.of(context)
            ..pop()
            ..push(MaterialPageRoute(builder: (context) => const SocialDogeHome()));
        }
      },
    );
  }
}
