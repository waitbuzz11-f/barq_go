import 'package:easy_localization/easy_localization.dart';

import 'app_regex.dart';
import 'validation_keys.dart';

abstract final class Validators {
  Validators._();

  static String? required(String? value) {
    if (value == null || value.trim().isEmpty) {
      return ValidationKeys.requiredField.tr();
    }

    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return ValidationKeys.emailRequired.tr();
    }

    if (!AppRegex.isEmailValid(value)) {
      return ValidationKeys.emailInvalid.tr();
    }

    return null;
  }

  static String? name(String? value) {
    if (value == null || value.trim().isEmpty) {
      return ValidationKeys.nameRequired.tr();
    }

    if (!AppRegex.isNameValid(value)) {
      return ValidationKeys.nameInvalid.tr();
    }

    return null;
  }

  static String? password(String? value) {
    if (value == null || value.trim().isEmpty) {
      return ValidationKeys.passwordRequired.tr();
    }

    if (!AppRegex.isPasswordValid(value)) {
      return ValidationKeys.passwordInvalid.tr();
    }

    return null;
  }

  static String? highSecurityPassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return ValidationKeys.passwordRequired.tr();
    }

    if (!AppRegex.isHighSecurityPasswordValid(value)) {
      return ValidationKeys.passwordInvalid.tr();
    }

    return null;
  }

  static String? confirmPassword(
    String? value,
    String? password,
  ) {
    if (value == null || value.trim().isEmpty) {
      return ValidationKeys.passwordRequired.tr();
    }

    if (value != password) {
      return ValidationKeys.passwordNotMatch.tr();
    }

    return null;
  }

  static String? egyptPhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return ValidationKeys.phoneRequired.tr();
    }

    if (!AppRegex.isEgyptPhoneValid(value)) {
      return ValidationKeys.phoneInvalid.tr();
    }

    return null;
  }

  static String? saudiPhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return ValidationKeys.phoneRequired.tr();
    }

    if (!AppRegex.isSaudiPhoneValid(value)) {
      return ValidationKeys.phoneInvalid.tr();
    }

    return null;
  }

  static String? uaePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return ValidationKeys.phoneRequired.tr();
    }

    if (!AppRegex.isUAEPhoneValid(value)) {
      return ValidationKeys.phoneInvalid.tr();
    }

    return null;
  }

  static String? age(
    String? value, {
    int min = 1,
    int max = 120,
  }) {
    if (value == null || value.trim().isEmpty) {
      return ValidationKeys.ageRequired.tr();
    }

    final age = int.tryParse(value);

    if (age == null) {
      return ValidationKeys.ageInvalid.tr();
    }

    if (age < min || age > max) {
      return ValidationKeys.ageRange.tr(
        args: [
          min.toString(),
          max.toString(),
        ],
      );
    }

    return null;
  }
}