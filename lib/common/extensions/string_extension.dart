import 'package:alfaisal_for_advertising/common/constants/strings.dart';

extension StringExtension on String? {
  String get fullPathImage {
    return Strings.apiImagePath + (this ?? '');
  }
}
