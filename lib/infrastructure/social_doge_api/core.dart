// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

// Project imports:
import 'package:social_doge/core/logger.dart';
import 'package:social_doge/infrastructure/social_doge_api/constant/strings.dart';
import 'package:social_doge/infrastructure/social_doge_api/constant/urls.dart';
import 'package:social_doge/infrastructure/social_doge_api/model/main.dart';

class SocialDogeAPI {
  final String? cookiePath;
  late final Dio dio;
  late final CookieJar cookieJar;

  SocialDogeAPI({this.cookiePath}) {
    dio = Dio(
      BaseOptions(
        baseUrl: TwitterBase.base.toString(),
        connectTimeout: const Duration(seconds: 50),
        receiveTimeout: const Duration(seconds: 30),
        contentType: 'application/json',
      ),
    );
    cookieJar = PersistCookieJar(storage: FileStorage(cookiePath));
    dio.interceptors.addAll([
      CookieManager(cookieJar),
      HeaderAuth(cookieJar),
      LogInterceptor(),
    ]);
  }

  Future<Iterable<Instruction>> getFollowers({required String userId, String? cursor}) async {
    final response = await dio.get(
      TwitterGraphQL.followers.path,
      queryParameters: {
        "variables": jsonEncode({
          "userId": userId,
          "count": 20,
          "includePromotedContent": false,
          "withDownvotePerspective": false,
          "withReactionsMetadata": false,
          "withReactionsPerspective": false
        }),
        "features": jsonEncode({
          "blue_business_profile_image_shape_enabled": true,
          "responsive_web_graphql_exclude_directive_enabled": true,
          "verified_phone_label_enabled": false,
          "responsive_web_graphql_timeline_navigation_enabled": true,
          "responsive_web_graphql_skip_user_profile_image_extensions_enabled": false,
          "tweetypie_unmention_optimization_enabled": true,
          "vibe_api_enabled": true,
          "responsive_web_edit_tweet_api_enabled": true,
          "graphql_is_translatable_rweb_tweet_is_translatable_enabled": true,
          "view_counts_everywhere_api_enabled": true,
          "longform_notetweets_consumption_enabled": true,
          "tweet_awards_web_tipping_enabled": false,
          "freedom_of_speech_not_reach_fetch_enabled": false,
          "standardized_nudges_misinfo": true,
          "tweet_with_visibility_results_prefer_gql_limited_actions_policy_enabled": false,
          "interactive_text_enabled": true,
          "responsive_web_text_conversations_enabled": false,
          "longform_notetweets_richtext_consumption_enabled": true,
          "responsive_web_enhance_cards_enabled": false
        }),
      },
    );
    List<Map<String, dynamic>> instructions = response.data["data"]["user"]["result"]["timeline"]["timeline"]["instructions"].cast<Map<String, dynamic>>();
    return instructions.map((e) => Instruction.fromJson(e));
  }

  Future<Iterable<Instruction>> getFollowing({required String userId, String? cursor}) async {
    final response = await dio.get(
      TwitterGraphQL.following.path,
      queryParameters: {
        "variables": jsonEncode({
          "userId": userId,
          "count": 20,
          "includePromotedContent": false,
          "withDownvotePerspective": false,
          "withReactionsMetadata": false,
          "withReactionsPerspective": false
        }),
        "features": jsonEncode({
          "blue_business_profile_image_shape_enabled": true,
          "responsive_web_graphql_exclude_directive_enabled": true,
          "verified_phone_label_enabled": false,
          "responsive_web_graphql_timeline_navigation_enabled": true,
          "responsive_web_graphql_skip_user_profile_image_extensions_enabled": false,
          "tweetypie_unmention_optimization_enabled": true,
          "vibe_api_enabled": true,
          "responsive_web_edit_tweet_api_enabled": true,
          "graphql_is_translatable_rweb_tweet_is_translatable_enabled": true,
          "view_counts_everywhere_api_enabled": true,
          "longform_notetweets_consumption_enabled": true,
          "tweet_awards_web_tipping_enabled": false,
          "freedom_of_speech_not_reach_fetch_enabled": false,
          "standardized_nudges_misinfo": true,
          "tweet_with_visibility_results_prefer_gql_limited_actions_policy_enabled": false,
          "interactive_text_enabled": true,
          "responsive_web_text_conversations_enabled": false,
          "longform_notetweets_richtext_consumption_enabled": true,
          "responsive_web_enhance_cards_enabled": false
        }),
      },
    );

    List<Map<String, dynamic>> instructions = response.data["data"]["user"]["result"]["timeline"]["timeline"]["instructions"].cast<Map<String, dynamic>>();
    return instructions.map((e) => Instruction.fromJson(e));
  }
}

class HeaderAuth extends Interceptor {
  final CookieJar cookieJar;
  HeaderAuth(this.cookieJar);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      options.headers.addAll({
        "authorization": "Bearer ${TwitterAuth.bearer}",
        "User-Agent": TwitterAuth.userAgent,
        "x-csrf-token": (await cookieJar.loadForRequest(TwitterBase.base)).firstWhere((element) => element.name == TwitterAuth.ct0).value,
        "x-twitter-active-user": "yes",
        "x-twitter-auth-type": "OAuth2Session",
        "x-twitter-client-language": "ja",
      });
    } catch (e, trace) {
      logger.w(e, e, trace);
      return handler.reject(DioError(requestOptions: options));
    }
    return handler.next(options);
  }
}
