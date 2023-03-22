import 'package:alfaisal_for_advertising/common/core_data_source/hive_helper/hive_helper.dart';
import 'package:alfaisal_for_advertising/common/core_data_source/sentry_service.dart';
import 'package:alfaisal_for_advertising/common/utils.dart';
import 'package:alfaisal_for_advertising/injection/injection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
    Utils.showLoading();
    await Future.wait(<Future<dynamic>>[
      ref.refresh(hiveHelperProvider.future),
    ]);
  } catch (e) {
    logger.e(e);
  } finally {
    Utils.hideLoading();
  }
}
