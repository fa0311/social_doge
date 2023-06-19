
/*
@Riverpod(keepAlive: true)
Future<UserDB> getUser(GetUserRef ref, String id) async {
  final db = await ref.read(getDatabaseProvider.future);
  final user = await db.query('user', where: 'twitter_id = ?', whereArgs: [id]);
  return UserDB.fromQuery(user.first);
}
*/

