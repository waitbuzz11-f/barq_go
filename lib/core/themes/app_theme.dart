import 'package:flutter/material.dart';

import 'colors_manager.dart';
import '../resources/font_family.dart';

abstract final class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: ColorsManager.background,
    fontFamily: FontFamily.ibmFont,
  );
}
