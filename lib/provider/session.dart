// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

// Project imports:
import 'package:social_doge/infrastructure/social_doge_api/core.dart';

final socialDogeAPIProvider = StateProvider.family<SocialDogeAPI, String>((ref, path) => SocialDogeAPI(cookiePath: path));

final loginSessionProvider = FutureProvider<SocialDogeAPI>((ref) async {
  final directory = await getApplicationDocumentsDirectory();
  return ref.watch(socialDogeAPIProvider("${directory.path}/.cookie/aaaaa"));
});
