import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alfaisal_for_advertising/injection/injection.dart';

class Logger extends ProviderObserver {
  @override
  void didAddProvider(
      ProviderBase provider, Object? value, ProviderContainer container) {
    logger.d(provider.name ?? provider.runtimeType);
  }

  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer container) {
    logger.d(provider.name ?? provider.runtimeType);
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    logger.d(
        'OLD VALUE \n ${provider.name ?? provider.runtimeType} \n NEW VALUE \n ${newValue.runtimeType}');
  }
}
