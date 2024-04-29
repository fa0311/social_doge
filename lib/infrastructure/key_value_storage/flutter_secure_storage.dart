import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:social_doge/infrastructure/key_value_storage/key_value_storage.dart';

class SecureKeyValue extends KeyValueStorage {
  SecureKeyValue(this._storage);
  final FlutterSecureStorage _storage;

  @override
  Future<String?> getString(String key) {
    return _storage.read(key: key);
  }

  @override
  Future<void> setString(String key, String value) {
    return _storage.write(key: key, value: value);
  }

  @override
  Future<void> remove(String key) {
    return _storage.delete(key: key);
  }
}
