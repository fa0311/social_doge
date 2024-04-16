import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// グラフィカルに表示するロガーの設定
final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
  ),
);

/// Dio の Http リクエストのロガーの設定
final dioLogger = PrettyDioLogger(responseBody: false);

/// Riverpod の Provider のログを表示する
class ProviderLogger extends ProviderObserver {
  /// 共通のログを表示するか
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
