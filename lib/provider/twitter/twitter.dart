import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:social_doge/util/inappwebview.dart';
import 'package:social_doge/util/logger.dart';
import 'package:twitter_openapi_dart/twitter_openapi_dart.dart';
import 'package:twitter_openapi_dart_generated/twitter_openapi_dart_generated.dart';

part 'twitter.g.dart';

@Riverpod(keepAlive: true)
Future<TwitterOpenapiDartClient> getTwitterClient(GetTwitterClientRef ref) async {
  final interceptor = FlutterInappwebviewDio();
  final client = TwitterOpenapiDart().getTwitterOpenapiDartClient(interceptor: [interceptor, dioLogger]);
  return client;
}

@Riverpod(keepAlive: true)
Future<User> getUserByScreenName(GetUserByScreenNameRef ref, String twitterId) async {
  final client = await ref.watch(getTwitterClientProvider.future);
  final user = await client.getUserApi().getUserByScreenName(screenName: twitterId);
  return user.data.user;
}
