import 'dart:io';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:dio/dio.dart';

class FlutterInappwebviewDio extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      final cookie = await CookieManager.instance().getCookies(url: options.uri);
      if (cookie.isNotEmpty) {
        options.headers[HttpHeaders.cookieHeader] = getCookies(cookie);
      }
      handler.next(options);
    } catch (e) {
      handler.reject(DioError(requestOptions: options, error: e), true);
    }
  }

  static String getCookies(List<Cookie> cookies) {
    return cookies.map((cookie) => '${cookie.name}=${cookie.value}').join('; ');
  }
}