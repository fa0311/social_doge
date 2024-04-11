import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_doge/infrastructure/key_value_storage/key_value_storage.dart';

/// キーバリューストレージ
class SharedKeyValue extends KeyValueStorage {
  SharedKeyValue(this._storage);
  final SharedPreferences _storage;

  @override
  Future<String?> getString(String key) async {
    return _storage.getString(key);
  }

  @override
  Future<void> setString(String key, String value) {
    return _storage.setString(key, value);
  }

  @override
  Future<void> remove(String key) {
    return _storage.remove(key);
  }
}
