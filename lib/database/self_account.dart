import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:social_doge/database/core.dart';
part 'self_account.g.dart';

@Riverpod(keepAlive: true)
class SelfAccount extends _$SelfAccount {
  @override
  String? build() => null;

  Future<void> get() async {
    final db = ref.read(getDatabaseProvider);
    final user = await db.loginAccount();
    state = user?.selfTwitterId;
  }

  Future<void> update(String twitterId) async {
    final db = ref.read(getDatabaseProvider);
    final user = await db.loginAccount();

    if (user == null) {
      final insertUser = SelfAccountTableCompanion.insert(selfTwitterId: twitterId, loginTime: DateTime.now());
      await db.addAccount(insertUser);
      state = insertUser.selfTwitterId.value;
    } else {
      final newUser = user.copyWith(loginTime: DateTime.now());
      await db.updateAccount(newUser);
      state = newUser.selfTwitterId;
    }
  }
}
