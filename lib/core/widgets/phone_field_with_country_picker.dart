import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';

import '../validation/validation_keys.dart';
import 'app_text_field.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_phone_validator/country_phone_validator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppPhoneFieldWithCountryPicker extends StatefulWidget {
  final TextEditingController phoneController;
  final TextEditingController countryCodeController;

  final String hintText;

  final String defaultCountryCode;

  final String? Function(String?)? validator;

  final ValueChanged<String>? onCountryChanged;

  const AppPhoneFieldWithCountryPicker({
    super.key,
    required this.phoneController,
    required this.countryCodeController,
    required this.hintText,
    this.validator,
    this.onCountryChanged,
    this.defaultCountryCode = '+965',
  });

  @override
  State<AppPhoneFieldWithCountryPicker> createState() =>
      _AppPhoneFieldWithCountryPickerState();
}

class _AppPhoneFieldWithCountryPickerState
    extends State<AppPhoneFieldWithCountryPicker> {
  int? _maxLength;

  @override
  void initState() {
    super.initState();

    if (widget.countryCodeController.text.isEmpty) {
      widget.countryCodeController.text = widget.defaultCountryCode;
    }

    _updateCountryConstraints(widget.countryCodeController.text);
  }

  void _updateCountryConstraints(String dialCode) {
    final country = CountryUtils.getCountryByDialCode(dialCode);

    setState(() {
      _maxLength = country?.phoneMaxLength ?? 15;
    });
  }

  String? _defaultValidator(String? value) {
    final phone = value?.trim() ?? '';

    if (phone.isEmpty) {
      return ValidationKeys.phoneRequired.tr();
    }

    final isValid = CountryUtils.validatePhoneNumber(
      phone,
      widget.countryCodeController.text,
    );

    if (!isValid) {
      return ValidationKeys.phoneInvalid.tr();
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CountryCodePicker(
          initialSelection: widget.countryCodeController.text,
          textStyle: TextStyles.textStyleBold16.copyWith(
            color: ColorsManager.surfacePrimary,
          ),
          favorite: [widget.defaultCountryCode],
          showDropDownButton: true,
          showCountryOnly: false,
          showOnlyCountryWhenClosed: false,
          showFlag: true,

          onChanged: (country) {
            final dialCode = country.dialCode ?? '';

            widget.countryCodeController.text = dialCode;

            _updateCountryConstraints(dialCode);

            widget.onCountryChanged?.call(dialCode);
          },
        ),
        const SizedBox(width: 8),
        Expanded(
          child: AppTextFormField(
            fillColor: ColorsManager.darkBackground,
            contentPadding: EdgeInsetsGeometry.all(16),
            controller: widget.phoneController,
            hintText: widget.hintText,
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
            maxLength: _maxLength,
            validator: widget.validator ?? _defaultValidator,
          ),
        ),
      ],
    );
  }
}
