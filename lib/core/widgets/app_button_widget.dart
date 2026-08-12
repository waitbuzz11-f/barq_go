import '../themes/app_text_styles.dart';
import '../themes/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class AppButtonWidget extends StatelessWidget {
  const AppButtonWidget({
    super.key,
    required this.text,
    this.onTap,
    this.backgroundColor = ColorsManager.brandPrimary,
    this.textColor = ColorsManager.textPrimary,
    this.textStyle,
    this.borderColor,
    this.height,
    this.width = double.infinity,
    this.icon,
    this.radius,
  });

  final VoidCallback? onTap;

  final String text;

  final Color backgroundColor;
  final Color textColor;

  final TextStyle? textStyle;
  final Color? borderColor;

  final double? height;
  final double width;
  final double? radius;

  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(radius ?? 16.r),
        child: Ink(
          height: height ?? 54.h,
          width: width,
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            color: backgroundColor,
            border: borderColor != null
                ? Border.all(color: borderColor!)
                : null,
            borderRadius: BorderRadius.circular(radius ?? 16.r),
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    tr(text),
                    overflow: TextOverflow.ellipsis,
                    style:
                        textStyle ??
                        TextStyles.textStyleExtraBold16.copyWith(
                          color: textColor,
                        ),
                  ),
                ),
                if (icon != null) ...[SizedBox(width: 4.w), icon!],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
