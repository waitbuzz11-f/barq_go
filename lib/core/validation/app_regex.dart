abstract final class AppRegex {
  AppRegex._();

  static const int minPasswordLength = 8;

  static final RegExp _emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');

  static final RegExp _nameRegex = RegExp(
    r"^[\p{L} ,.'-]*$",
    caseSensitive: false,
    unicode: true,
    dotAll: true,
  );

  static final RegExp _egyptPhoneRegex = RegExp(r'^(010|011|012|015)[0-9]{8}$');

  static final RegExp _uaePhoneRegex = RegExp(r'^(?:05\d{8}|\+9715\d{8})$');

  static final RegExp _saudiPhoneRegex = RegExp(r'^(05|5)\d{8}$');

  static final RegExp _passwordRegex = RegExp(r'^(?=.*?[0-9]).{8,}$');

  static final RegExp _highSecurityPasswordRegex = RegExp(
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
  );

  static final RegExp _lowerCaseRegex = RegExp(r'[a-z]');
  static final RegExp _upperCaseRegex = RegExp(r'[A-Z]');
  static final RegExp _numberRegex = RegExp(r'\d');
  static final RegExp _specialCharacterRegex = RegExp(r'[#?!@$%^&*-]');

  static bool isEmailValid(String value) => _emailRegex.hasMatch(value.trim());

  static bool isNameValid(String value) => _nameRegex.hasMatch(value.trim());

  static bool isPasswordValid(String value) => _passwordRegex.hasMatch(value);

  static bool isHighSecurityPasswordValid(String value) =>
      _highSecurityPasswordRegex.hasMatch(value);

  static bool isEgyptPhoneValid(String value) =>
      _egyptPhoneRegex.hasMatch(value);

  static bool isUAEPhoneValid(String value) => _uaePhoneRegex.hasMatch(value);

  static bool isSaudiPhoneValid(String value) =>
      _saudiPhoneRegex.hasMatch(value);

  static bool hasLowerCase(String value) => _lowerCaseRegex.hasMatch(value);

  static bool hasUpperCase(String value) => _upperCaseRegex.hasMatch(value);

  static bool hasNumber(String value) => _numberRegex.hasMatch(value);

  static bool hasSpecialCharacter(String value) =>
      _specialCharacterRegex.hasMatch(value);

  static bool hasMinLength(String value) => value.length >= minPasswordLength;
}
