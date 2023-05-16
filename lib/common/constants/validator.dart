// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum ValidationType { name, notEmpty, email, validationCode }

class AppValidator {
  static FilteringTextInputFormatter priceValueOnly() {
    return FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)'));
  }

  static validatePassword(String value, BuildContext context) {
    Pattern pattern = r'^.{6,}$';
    RegExp regex = RegExp(pattern.toString());
    if (value.isEmpty) {
      return AppLocalizations.of(context)!.please_enter_pass;
    } else if (!regex.hasMatch(value)) {
      return AppLocalizations.of(context)!.enter_valid_password;
    }
    return null;
  }

  static validateConfirmPassword(
      String value, String confirm, BuildContext context) {
    if (value.isEmpty) {
      return AppLocalizations.of(context)!.please_enter_pass;
    } else if (value != confirm) {
      return AppLocalizations.of(context)!.passwords_do_not_match;
    }
    return null;
  }

  static validatePhone(
      String? phone, String? numbersCount, BuildContext context) {
    if (phone == null || phone.isEmpty) {
      return AppLocalizations.of(context)!.please_fill_this_field;
    } else if (phone.length != int.parse(numbersCount ?? '11')) {
      return AppLocalizations.of(context)!
          .enter_valid_phone(int.parse(numbersCount ?? '11'));
    }
    return null;
  }

  static String? validateFields(
      String? value, ValidationType fieldType, BuildContext context) {
    value ??= '';
    if ((fieldType == ValidationType.notEmpty && value.trim().isEmpty) ||
        value.trim().isEmpty) {
      return AppLocalizations.of(context)!.please_fill_this_field;
    } else if (fieldType == ValidationType.name) {
      if (!RegExp(r'^[a-zA-zأ-ي\s]+$').hasMatch(value)) {
        return AppLocalizations.of(context)!.enter_valid_name;
      }
    } else if (fieldType == ValidationType.email) {
      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
        return AppLocalizations.of(context)!.enter_valid_email;
      }
    }
    return null;
  }
}
