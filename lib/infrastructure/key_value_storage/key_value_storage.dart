/// キーバリューストレージの抽象クラス
abstract class KeyValueStorage {
  Future<String?> getString(String key);
  Future<void> setString(String key, String value);
  Future<void> remove(String key);
}
