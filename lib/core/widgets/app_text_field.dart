import '../themes/app_text_styles.dart';
import '../themes/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final String hintText;

  final TextEditingController? controller;
  final String? Function(String?)? validator;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final VoidCallback? onPrefixTap;
  final VoidCallback? onSuffixTap;

  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  final VoidCallback? onTap;

  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  final bool obscureText;
  final bool readOnly;
  final bool enabled;

  final int? maxLines;
  final int? maxLength;

  final Color? fillColor;
  final Color? textColor;
  final Color hintColor;

  final EdgeInsetsGeometry contentPadding;

  final bool showBorder;

  final AutovalidateMode? autovalidateMode;

  const AppTextFormField({
    super.key,
    required this.hintText,
    this.controller,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.onPrefixTap,
    this.onSuffixTap,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.readOnly = false,
    this.enabled = true,
    this.maxLines = 1,
    this.maxLength,
    this.fillColor,
    this.textColor,
    this.hintColor = ColorsManager.textSecondary,
    this.showBorder = true,
    this.autovalidateMode,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 16,
    ),
  });

  @override
  Widget build(BuildContext context) {
    final enabledBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: showBorder
          ? BorderSide(color: ColorsManager.border, width: 1.5.w)
          : BorderSide.none,
    );

    final focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: showBorder
          ? BorderSide(color: ColorsManager.brandPrimary, width: 1.8.w)
          : BorderSide.none,
    );

    final errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(color: ColorsManager.danger, width: 1.5.w),
    );

    return TextFormField(
      controller: controller,
      validator: validator,
      autovalidateMode: autovalidateMode,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      onTap: onTap,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: obscureText,
      readOnly: readOnly,
      enabled: enabled,
      maxLines: maxLines,
      maxLength: maxLength,
      cursorColor: ColorsManager.brandPrimary,
      style: TextStyles.textStyleRegular14.copyWith(color: textColor),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyles.textStyleSemiBold15.copyWith(color: hintColor),
        filled: true,
        fillColor: fillColor ?? ColorsManager.surfaceSecondary,
        isDense: true,
        contentPadding: contentPadding,

        border: enabledBorder,
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        errorBorder: errorBorder,
        focusedErrorBorder: errorBorder,

        prefixIcon: _buildIcon(icon: prefixIcon, onTap: onPrefixTap),

        suffixIcon: _buildIcon(icon: suffixIcon, onTap: onSuffixTap),
      ),
    );
  }

  Widget? _buildIcon({Widget? icon, VoidCallback? onTap}) {
    if (icon == null) return null;

    if (onTap == null) {
      return Padding(padding: EdgeInsets.all(14.r), child: icon);
    }

    return InkWell(
      onTap: onTap,
      child: Padding(padding: EdgeInsets.all(14.r), child: icon),
    );
  }
}
