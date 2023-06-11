// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_doge/database/self_account.dart';
import 'package:social_doge/view/settings/account.dart';

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
        try {
          final url = await controller.getUrl();
          if (url == null) return;
          if (url.path == url.resolve("home").path) {
            if (!context.mounted) return;
            if (ref.read(selfAccountProvider) == null) {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const AccountSettingsWalkthrough()), (_) => false);
            } else {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const SocialDogeHome()), (_) => false);
            }
          }
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
        }
      },
    );
  }
}
