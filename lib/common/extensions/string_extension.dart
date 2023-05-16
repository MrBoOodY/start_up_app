import 'package:start_up_app/common/constants/strings.dart';

extension StringExtension on String? {
  String get fullPathImage {
    return AppStrings.instance.apiImagePath + (this ?? '');
  }
}
