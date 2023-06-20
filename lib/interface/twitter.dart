import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:social_doge/auth/inappwebview.dart';
import 'package:twitter_openapi_dart/twitter_openapi_dart.dart';
import 'package:twitter_openapi_dart_generated/twitter_openapi_dart_generated.dart';
part 'twitter.g.dart';

@Riverpod(keepAlive: true)
Future<TwitterOpenapiDartClient> getTwitterClient(GetTwitterClientRef ref) async {
  final client = await TwitterOpenapiDart().getClient();
  client.api.dio.interceptors.insert(0, FlutterInappwebviewDio());
  return client;
}

@Riverpod(keepAlive: true)
Future<User> twitterUser(TwitterUserRef ref, String twitterId) async {
  final client = await ref.watch(getTwitterClientProvider.future);
  final user = await client.getUserApi().getUserByScreenName(screenName: twitterId);
  return user.data;
}
