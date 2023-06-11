import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:social_doge/database/core.dart';
import 'package:social_doge/database/user.dart';

part 'self_account.g.dart';

@Riverpod(keepAlive: true)
class SelfAccount extends _$SelfAccount {
  @override
  String? build() => null;

  get selfTwitterId => state;

  Future<void> get() async {
    final db = await ref.read(getDatabaseProvider.future);
    final user = await db.query("self_account", limit: 1, orderBy: "login_time DESC");
    state = user.isEmpty ? null : user.first["self_twitter_id"] as String;
  }

  Future<void> update(String twitterId) async {
    final db = await ref.read(getDatabaseProvider.future);
    final user = SelfTwitter(
      selfTwitterId: twitterId,
      loginTime: DateTime.now().millisecondsSinceEpoch,
    );
    await db.update("self_account", user.toMap(), where: "self_twitter_id = ?", whereArgs: [state]);

    state = twitterId;
  }
}
