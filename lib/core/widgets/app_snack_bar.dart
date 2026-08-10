import '../themes/colors_manager.dart';
import 'package:flutter/material.dart';

class AppSnackBar {
  AppSnackBar._();

  static void show(
    BuildContext context, {
    required String message,
    Color? backgroundColor,
    TextStyle? textStyle,
    String? actionLabel,
    VoidCallback? onActionPressed,
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message, style: textStyle),
          backgroundColor: backgroundColor,
          behavior: SnackBarBehavior.floating,
          action: actionLabel == null
              ? null
              : SnackBarAction(
                  label: actionLabel,
                  onPressed: onActionPressed ?? () {},
                ),
          duration: duration,
        ),
      );
  }

  static void success(BuildContext context, {required String message}) {
    show(context, message: message, backgroundColor: ColorsManager.success);
  }

  static void error(BuildContext context, {required String message}) {
    show(context, message: message, backgroundColor: ColorsManager.danger);
  }

  static void warning(BuildContext context, {required String message}) {
    show(context, message: message, backgroundColor: ColorsManager.categoryInterCity);
  }
}
