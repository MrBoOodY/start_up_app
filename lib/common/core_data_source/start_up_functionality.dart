import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:start_up_app/common/core_data_source/hive/hive_helper.dart';
import 'package:start_up_app/common/core_data_source/sentry_service.dart';
import 'package:start_up_app/common/logger.dart';
import 'package:start_up_app/common/utils.dart';

part 'start_up_functionality.g.dart';

@riverpod
Future<void> startUpFunctionality(StartUpFunctionalityRef ref) async {
  try {
    await Future.wait(<Future<dynamic>>[
      ref.read(hiveHelperProvider.future),
      SentryService.init(),
    ]);
  } catch (e) {
    logger.e(e);
  }
}

@riverpod
Future<void> startUpRefresh(StartUpRefreshRef ref) async {
  try {
    ref.read(utilsProvider).showLoading();
    await Future.wait(<Future<dynamic>>[
      ref.refresh(hiveHelperProvider.future),
    ]);
  } catch (e) {
    logger.e(e);
  } finally {
    ref.read(utilsProvider).hideLoading();
  }
}
