// Flutter imports:

// Dart imports:
import 'dart:io' as io;

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:

import 'package:social_doge/component/loading.dart';
import 'package:social_doge/component/scroll.dart';
import 'package:social_doge/constant/uris.dart';
import 'package:social_doge/core/logger.dart';
import 'package:social_doge/infrastructure/social_doge_api/constant/strings.dart';
import 'package:social_doge/infrastructure/social_doge_api/constant/urls.dart';
import 'package:social_doge/provider/session.dart';
import 'package:social_doge/view/top/home.dart';

final webViewInitProvider = FutureProvider.autoDispose<void>((ref) async {
  CookieManager cookieManager = CookieManager.instance();
  await cookieManager.deleteAllCookies();
  final session = await ref.read(loginSessionProvider.future);

  final ioCookies = await session.cookieJar.loadForRequest(TwitterBase.base);
  for (final ioCookie in ioCookies) {
    await cookieManager.setCookie(
      url: TwitterBase.all,
      name: ioCookie.name,
      value: ioCookie.value,
      isSecure: ioCookie.secure,
      isHttpOnly: ioCookie.httpOnly,
    );
  }
});
InAppWebViewController? webViewController;
final webViewKey = GlobalKey();

class SocialDogeWebLogin extends ConsumerWidget {
  const SocialDogeWebLogin({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final init = ref.watch(webViewInitProvider);
    goBack() async {
      if (await webViewController?.canGoBack() ?? false) {
        await webViewController?.goBack();
        return true;
      }
      return false;
    }

    return WillPopScope(
      onWillPop: goBack,
      child: Scaffold(
        appBar: AppBar(leading: BackButton(onPressed: goBack)),
        body: init.when(
          loading: () => const Loading(),
          error: (e, trace) {
            logger.w(e, e, trace);
            return ScrollWidget(
              onRefresh: () => ref.refresh(webViewInitProvider.future),
              child: Container(),
            );
          },
          data: (data) => InAppWebView(
            initialUrlRequest: URLRequest(url: TwitterUris.login),
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                useShouldOverrideUrlLoading: true,
              ),
            ),
            onWebViewCreated: (controller) {
              webViewController = controller;
            },
            onTitleChanged: (controller, title) async {
              CookieManager cookieManager = CookieManager.instance();
              final url = await controller.getUrl();
              if (url == null) return;
              if (url.path == TwitterUris.home.path) {
                final authToken = await cookieManager.getCookie(url: TwitterBase.all, name: TwitterAuth.authToken);
                logger.i(authToken);
                if (authToken != null) {
                  final List<Cookie> cookies = await cookieManager.getCookies(url: TwitterBase.all);
                  final ioCookies = [
                    for (final cookie in cookies)
                      io.Cookie(cookie.name, cookie.value)
                        ..secure = cookie.isSecure ?? false
                        ..httpOnly = cookie.isHttpOnly ?? false
                  ];
                  final session = await ref.read(loginSessionProvider.future);
                  try {
                    await session.cookieJar.deleteAll();
                  } catch (e, trace) {
                    logger.w(e, e, trace);
                  }
                  try {
                    await session.cookieJar.saveFromResponse(TwitterBase.base, ioCookies);
                  } catch (e, trace) {
                    logger.w(e, e, trace);
                  }

                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const SocialDogeHome()), (_) => false);
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
