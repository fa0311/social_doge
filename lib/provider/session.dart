// Package imports:
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:social_doge/infrastructure/social_doge_api/core.dart';

part 'session.g.dart';

@riverpod
SocialDogeAPI socialDogeAPI(SocialDogeAPIRef ref, {required String path}) => SocialDogeAPI(cookiePath: path);

@riverpod
Future<SocialDogeAPI> loginSession(LoginSessionRef ref) async {
  final directory = await getApplicationDocumentsDirectory();
  return ref.watch(socialDogeAPIProvider(path: "${directory.path}/.cookie/aaaaa"));
}
