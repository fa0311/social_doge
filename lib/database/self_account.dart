import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:social_doge/database/core.dart';
import 'package:social_doge/database/provider.dart';
part 'self_account.g.dart';

@Riverpod(keepAlive: true)
class SelfAccount extends _$SelfAccount {
  @override
  String? build() => null;

  String get id => state!;

  Future<void> get() async {
    final db = ref.read(getDatabaseProvider);
    final user = await db.loginAccount();
    state = user?.selfTwitterId;
  }

  Future<void> update(String twitterId) async {
    final db = ref.read(getDatabaseProvider);
    final insertUser = SelfAccountTableCompanion.insert(selfTwitterId: twitterId, loginTime: DateTime.now());
    await db.upsertAccount(insertUser);
    state = insertUser.selfTwitterId.value;
  }
}
