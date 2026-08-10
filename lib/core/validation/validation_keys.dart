abstract final class ValidationKeys {
  ValidationKeys._();

  static const requiredField = 'validation_required_field';

  static const emailRequired = 'validation_email_required';
  static const emailInvalid = 'validation_email_invalid';

  static const nameRequired = 'validation_name_required';
  static const nameInvalid = 'validation_name_invalid';

  static const passwordRequired = 'validation_password_required';
  static const passwordInvalid = 'validation_password_invalid';

  static const passwordNotMatch = 'validation_password_not_match';

  static const phoneRequired = 'validation_phone_required';
  static const phoneInvalid = 'validation_phone_invalid';

  static const ageRequired = 'validation_age_required';
  static const ageInvalid = 'validation_age_invalid';
  static const ageRange = 'validation_age_range';
}
