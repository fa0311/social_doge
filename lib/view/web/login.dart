import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_doge/database/self_account.dart';
import 'package:social_doge/view/settings/account.dart';
import 'package:social_doge/view/top/home.dart';

class TwitterLogin extends ConsumerWidget {
  const TwitterLogin({super.key});
  static Uri url = Uri.https('twitter.com', '/');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InAppWebView(
      initialUrlRequest: URLRequest(url: url.resolve('login')),
      onTitleChanged: (controller, title) async {
        try {
          final url = await controller.getUrl();
          if (url == null) {
            return;
          } else if (url.path == url.resolve('home').path) {
            if (!context.mounted) {
              return;
            } else if (ref.read(selfAccountProvider) == null) {
              await Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute<void>(builder: (context) => const AccountSettingsWalkthrough()), (_) => false);
            } else {
              await Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute<void>(builder: (context) => const SocialDogeHome()), (_) => false);
            }
          }
        } on Exception catch (e) {
          if (kDebugMode) {
            print(e);
          }
        }
      },
    );
  }
}
