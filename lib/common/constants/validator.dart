// 🐦 Flutter imports:
import 'package:flutter/services.dart';
import 'package:alfaisal_for_advertising/common/utils.dart';

enum ValidationType { name, notEmpty, email, validationCode }

class AppValidator {
  static FilteringTextInputFormatter priceValueOnly() {
    return FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)'));
  }

  static validatePassword(String value) {
    Pattern pattern = r'^.{6,}$';
    RegExp regex = RegExp(pattern.toString());
    if (value.isEmpty) {
      return Utils.localization?.please_enter_pass ?? '';
    } else if (!regex.hasMatch(value)) {
      return Utils.localization?.enter_valid_password ?? '';
    }
    return null;
  }

  static validateConfirmPassword(String value, String confirm) {
    if (value.isEmpty) {
      return Utils.localization?.please_enter_pass ?? '';
    } else if (value != confirm) {
      return Utils.localization?.passwords_do_not_match ?? '';
    }
    return null;
  }

  static validatePhone(String? phone, String? numbersCount) {
    if (phone == null || phone.isEmpty) {
      return Utils.localization?.please_fill_this_field ?? '';
    } else if (phone.length != int.parse(numbersCount ?? '11')) {
      return Utils.localization
              ?.enter_valid_phone(int.parse(numbersCount ?? '11')) ??
          '';
    }
    return null;
  }

  static String? validateFields(
    String? value,
    ValidationType fieldType,
  ) {
    value = value ?? '';
    if ((fieldType == ValidationType.notEmpty && value.trim().isEmpty) ||
        value.trim().isEmpty) {
      return Utils.localization?.please_fill_this_field ?? '';
    } else if (fieldType == ValidationType.name) {
      if (!RegExp(r'^[a-zA-zأ-ي\s]+$').hasMatch(value)) {
        return Utils.localization?.enter_valid_name ?? '';
      }
    } else if (fieldType == ValidationType.email) {
      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
        return Utils.localization?.enter_valid_email ?? '';
      }
    }
    return null;
  }
}
