import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FragilePackageCardForm extends StatelessWidget {
  const FragilePackageCardForm({
    super.key,
    required this.isSelected,
    required this.onTap,
  });

  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: isSelected
                ? ColorsManager.brandPrimary.withAlpha(9)
                : ColorsManager.surfacePrimary,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: isSelected
                  ? ColorsManager.brandPrimary
                  : ColorsManager.border,
            ),
          ),
          child: Row(
            children: [
              Radio<bool>(
                value: true,
                groupValue: isSelected,
                onChanged: (_) => onTap(),
                activeColor: ColorsManager.brandPrimary,
              ),
              8.horizontalSpace,
              Expanded(
                child: Text(
                  "fragile_package_needs_care".tr(),
                  style: TextStyles.textStyleSemiBold12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
