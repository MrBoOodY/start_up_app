import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:start_up_app/common/core_data_source/failure.dart';
import 'package:start_up_app/common/utils.dart';

extension AsyncValueExtension on AsyncValue {
  void handleErrorOrData(
      {required Function handleData,
      required AutoDisposeNotifierProviderRef ref}) {
    if (hasError) {
      final utils = ref.read(utilsProvider);
      if (error is Failure) {
        utils.handleFailures(error as Failure);
      } else {
        utils.showErrorToast(error.toString());
      }
    } else {
      handleData();
    }
  }
}
