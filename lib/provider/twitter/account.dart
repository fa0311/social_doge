import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:social_doge/infrastructure/database/core.dart';
import 'package:social_doge/provider/db/db.dart';
import 'package:social_doge/provider/twitter/twitter.dart';
import 'package:twitter_openapi_dart_generated/twitter_openapi_dart_generated.dart';

part 'account.g.dart';

@Riverpod(keepAlive: true)
class SelfAccount extends _$SelfAccount {
  @override
  FutureOr<String?> build() async {
    final db = ref.read(getDatabaseProvider);
    final user = await db.loginAccount();
    return user?.selfTwitterId;
  }

  Future<void> set(String value) async {
    state = await AsyncValue.guard(() async {
      await ref.read(getUserByScreenNameProvider(value).future);

      final db = ref.read(getDatabaseProvider);
      final insertUser = SelfAccountTableCompanion.insert(
        selfTwitterId: value,
        loginTime: DateTime.now(),
      );
      await db.upsertAccount(insertUser);
      return value;
    });
  }
}

@Riverpod(keepAlive: true)
Future<User> getSelfAccount(GetSelfAccountRef ref) async {
  final userId = await ref.watch(selfAccountProvider.future);
  return await ref.watch(getUserByScreenNameProvider(userId!).future);
}
