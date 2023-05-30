import 'package:start_up_app/common/core_data_source/failure.dart';
import 'package:start_up_app/common/utils.dart';

extension ObjectExtension on Object? {
  handleExceptions(dynamic ref) {
    final Utils utils = ref.read(utilsProvider);
    if (this is Failure) {
      utils.handleFailures(this as Failure);
    } else {
      utils.showErrorToast(toString());
    }
  }
}
