import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectableOptionCardForm extends StatelessWidget {
  const SelectableOptionCardForm({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 12.h,
          ),
          decoration: BoxDecoration(
            color: isSelected
                ? ColorsManager.brandPrimary.withAlpha(20)
                : ColorsManager.surfaceSecondary,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: isSelected
                  ? ColorsManager.brandPrimary
                  : ColorsManager.border,
            ),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyles.textStyleSemiBold12,
          ),
        ),
      ),
    );
  }
}