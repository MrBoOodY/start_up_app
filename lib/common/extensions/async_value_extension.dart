import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:start_up_app/common/extensions/object_extension.dart';

extension AsyncValueExtension on AsyncValue {
  void handleErrorOrData<T>(
      {required Function handleData, required dynamic ref}) {
    if (hasError) {
      error!.handleExceptions(ref);
    } else {
      handleData();
    }
  }
}
