import '../resources/font_family.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'font_weight_helper.dart';

abstract final class TextStyles {
  TextStyles._();

  static TextStyle _style({required double size, required FontWeight weight}) {
    return TextStyle(
      fontFamily: FontFamily.ibmFont,
      fontSize: size.sp,
      fontWeight: weight,
    );
  }

  // Regular
  static TextStyle get textStyleRegular11 =>
      _style(size: 11, weight: FontWeightHelper.regular);
  static TextStyle get textStyleRegular12 =>
      _style(size: 12, weight: FontWeightHelper.regular);
  static TextStyle get textStyleRegular14 =>
      _style(size: 14, weight: FontWeightHelper.regular);
  static TextStyle get textStyleRegular15 =>
      _style(size: 15, weight: FontWeightHelper.regular);
  static TextStyle get textStyleRegular16 =>
      _style(size: 16, weight: FontWeightHelper.regular);
  static TextStyle get textStyleRegular13 =>
      _style(size: 13, weight: FontWeightHelper.regular);
  static TextStyle get textStyleRegular18 =>
      _style(size: 18, weight: FontWeightHelper.regular);

  // Medium
  static TextStyle get textStyleMedium11 =>
      _style(size: 11, weight: FontWeightHelper.medium);

  // Semi Bold
  static TextStyle get textStyleSemiBold11 =>
      _style(size: 11, weight: FontWeightHelper.semiBold);
  static TextStyle get textStyleSemiBold12 =>
      _style(size: 12, weight: FontWeightHelper.semiBold);
  static TextStyle get textStyleSemiBold13 =>
      _style(size: 13, weight: FontWeightHelper.semiBold);
  static TextStyle get textStyleSemiBold14 =>
      _style(size: 14, weight: FontWeightHelper.semiBold);
  static TextStyle get textStyleSemiBold15 =>
      _style(size: 15, weight: FontWeightHelper.semiBold);

  // Bold
  static TextStyle get textStyleBold10 =>
      _style(size: 10, weight: FontWeightHelper.bold);
  static TextStyle get textStyleBold11 =>
      _style(size: 11, weight: FontWeightHelper.bold);
  static TextStyle get textStyleBold12 =>
      _style(size: 12, weight: FontWeightHelper.bold);
  static TextStyle get textStyleBold13 =>
      _style(size: 13, weight: FontWeightHelper.bold);
  static TextStyle get textStyleBold14 =>
      _style(size: 14, weight: FontWeightHelper.bold);
  static TextStyle get textStyleBold15 =>
      _style(size: 15, weight: FontWeightHelper.bold);
  static TextStyle get textStyleBold16 =>
      _style(size: 16, weight: FontWeightHelper.bold);
  static TextStyle get textStyleBold17 =>
      _style(size: 17, weight: FontWeightHelper.bold);
  static TextStyle get textStyleBold18 =>
      _style(size: 18, weight: FontWeightHelper.bold);
  static TextStyle get textStyleBold20 =>
      _style(size: 20, weight: FontWeightHelper.bold);
  static TextStyle get textStyleBold22 =>
      _style(size: 22, weight: FontWeightHelper.bold);
  static TextStyle get textStyleBold24 =>
      _style(size: 24, weight: FontWeightHelper.bold);
  static TextStyle get textStyleBold26 =>
      _style(size: 26, weight: FontWeightHelper.bold);
  static TextStyle get textStyleBold32 =>
      _style(size: 32, weight: FontWeightHelper.bold);
  static TextStyle get textStyleBold34 =>
      _style(size: 34, weight: FontWeightHelper.bold);
  static TextStyle get textStyleBold30 =>
      _style(size: 30, weight: FontWeightHelper.bold);

  // Extra Bold
  static TextStyle get textStyleExtraBold11 =>
      _style(size: 11, weight: FontWeightHelper.extraBold);
  static TextStyle get textStyleExtraBold13 =>
      _style(size: 13, weight: FontWeightHelper.extraBold);
  static TextStyle get textStyleExtraBold14 =>
      _style(size: 14, weight: FontWeightHelper.extraBold);
  static TextStyle get textStyleExtraBold16 =>
      _style(size: 16, weight: FontWeightHelper.extraBold);
  static TextStyle get textStyleExtraBold17 =>
      _style(size: 17, weight: FontWeightHelper.extraBold);
  static TextStyle get textStyleExtraBold18 =>
      _style(size: 18, weight: FontWeightHelper.extraBold);
  static TextStyle get textStyleExtraBold20 =>
      _style(size: 20, weight: FontWeightHelper.extraBold);
  static TextStyle get textStyleExtraBold22 =>
      _style(size: 22, weight: FontWeightHelper.extraBold);
  static TextStyle get textStyleExtraBold24 =>
      _style(size: 24, weight: FontWeightHelper.extraBold);
  static TextStyle get textStyleExtraBold26 =>
      _style(size: 26, weight: FontWeightHelper.extraBold);
  static TextStyle get textStyleExtraBold30 =>
      _style(size: 30, weight: FontWeightHelper.extraBold);
  static TextStyle get textStyleExtraBold32 =>
      _style(size: 32, weight: FontWeightHelper.extraBold);
  static TextStyle get textStyleExtraBold36 =>
      _style(size: 36, weight: FontWeightHelper.extraBold);
}
