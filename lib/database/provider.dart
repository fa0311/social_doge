import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:social_doge/database/core.dart';
part 'provider.g.dart';

@Riverpod(keepAlive: true)
SocialDogeDatabase getDatabase(GetDatabaseRef ref) {
  return SocialDogeDatabase();
}
