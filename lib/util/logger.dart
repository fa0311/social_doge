import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
  ),
);

final dioLogger = PrettyDioLogger(
  responseBody: false,
  logPrint: (obj) {
    final text = obj.toString();
    if (text.isEmpty) {
    } else if (text.length < 93) {
      debugPrint(text);
    } else {
      debugPrint('${text.substring(0, 90)}...');
    }
  },
);

class ProviderLogger extends ProviderObserver {
  static bool common = false;

  @override
  void didAddProvider(
    ProviderBase<dynamic> provider,
    Object? value,
    ProviderContainer container,
  ) {
    if (common) {
      logger.t('provider: ${provider.name ?? provider.runtimeType}, value: $value');
    }
  }

  @override
  void providerDidFail(
    ProviderBase<dynamic> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    logger.w('provider: ${provider.name}', error: error, stackTrace: stackTrace);
  }

  @override
  void didDisposeProvider(
    ProviderBase<dynamic> provider,
    ProviderContainer container,
  ) {
    if (common) {
      logger.t('provider: ${provider.name ?? provider.runtimeType}, disposed');
    }
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    if (common) {
      logger.t('provider: ${provider.name ?? provider.runtimeType}, value: $newValue');
    }
  }
}
