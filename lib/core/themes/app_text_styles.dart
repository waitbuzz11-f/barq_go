import '../resources/font_family.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'font_weight_helper.dart';

abstract final class TextStyles {
  TextStyles._();

  static TextStyle _style({required double size, required FontWeight weight}) {
    return TextStyle(
      fontFamily: FontFamily.arbFonts,
      fontSize: size.sp,
      fontWeight: weight,
    );
  }

  // Regular
  static TextStyle get textStyleRegular11 =>
      _style(size: 11, weight: FontWeightHelper.regular);
  static TextStyle get textStyleRegular14 =>
      _style(size: 14, weight: FontWeightHelper.regular);
  static TextStyle get textStyleRegular16 =>
      _style(size: 16, weight: FontWeightHelper.regular);
  static TextStyle get textStyleRegular13 =>
      _style(size: 13, weight: FontWeightHelper.regular);

  // Medium
  static TextStyle get textStyleMedium12 =>
      _style(size: 12, weight: FontWeightHelper.medium);

  // Semi Bold
  static TextStyle get textStyleSemiBold12 =>
      _style(size: 12, weight: FontWeightHelper.semiBold);
  static TextStyle get textStyleSemiBold13 =>
      _style(size: 13, weight: FontWeightHelper.semiBold);
  static TextStyle get textStyleSemiBold14 =>
      _style(size: 14, weight: FontWeightHelper.semiBold);

  // Bold
  static TextStyle get textStyleBold11 =>
      _style(size: 11, weight: FontWeightHelper.bold);
  static TextStyle get textStyleBold13 =>
      _style(size: 13, weight: FontWeightHelper.bold);
  static TextStyle get textStyleBold16 =>
      _style(size: 16, weight: FontWeightHelper.bold);
  static TextStyle get textStyleBold24 =>
      _style(size: 24, weight: FontWeightHelper.bold);
  static TextStyle get textStyleBold34 =>
      _style(size: 34, weight: FontWeightHelper.bold);

  // Extra Bold
  static TextStyle get textStyleExtraBold30 =>
      _style(size: 30, weight: FontWeightHelper.extraBold);
  static TextStyle get textStyleExtraBold16 =>
      _style(size: 16, weight: FontWeightHelper.extraBold);
  static TextStyle get textStyleExtraBold18 =>
      _style(size: 18, weight: FontWeightHelper.extraBold);
  static TextStyle get textStyleExtraBold32 =>
      _style(size: 32, weight: FontWeightHelper.extraBold);
}
