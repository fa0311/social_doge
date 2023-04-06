// Dart imports:

// Project imports:
import 'package:flutter/foundation.dart';

Map<String, dynamic> printJson(Map<String, dynamic> json) {
  if (kDebugMode) print(json['professional']);
  return json;
}
