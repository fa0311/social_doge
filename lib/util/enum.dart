/// Enum を安全に扱うための拡張
extension EnumByName<T extends Enum> on Iterable<T> {
  /// [byName] と同じだが、見つからない場合は[Exception]を投げる
  T bySafeName(String? name) {
    for (final value in this) {
      if (value.name == name) {
        return value;
      }
    }
    throw Exception('Not found');
  }

  /// [byName] と同じだが、見つからない場合はnullを返す
  T? byNameOrNull(String? name) {
    for (final value in this) {
      if (value.name == name) {
        return value;
      }
    }
    return null;
  }
}
