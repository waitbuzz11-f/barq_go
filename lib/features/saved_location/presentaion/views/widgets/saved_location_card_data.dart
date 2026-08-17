import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/box_shape_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SavedLocationCardData extends StatelessWidget {
  const SavedLocationCardData({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onDelete,
    required this.onEdit,
  });

  final String title;
  final String subTitle;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: ColorsManager.surfacePrimary,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: ListTile(
        minVerticalPadding: 0,
        leading: Container(
          width: 44.r,
          height: 44.r,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorsManager.surfaceSecondary,
          ),
          child: Image.asset(
            Assets.assetsImagesPngHome,
            width: 24.r,
            height: 24.r,
          ),
        ),
        title: Text(title.tr(), style: TextStyles.textStyleSemiBold14),
        subtitle: Padding(
          padding: EdgeInsets.only(top: 4.h),
          child: Text(
            subTitle.tr(),
            style: TextStyles.textStyleRegular12.copyWith(
              color: ColorsManager.textSecondary,
            ),
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: onDelete,
              borderRadius: BorderRadius.circular(50.r),
              child: BoxShapeIcon(
                boxColor: ColorsManager.danger.withValues(alpha: 0.08),
                assetPath: Assets.assetsImagesIconsDelete,
              ),
            ),
            8.horizontalSpace,
            InkWell(
              onTap: onEdit,
              borderRadius: BorderRadius.circular(50.r),
              child: BoxShapeIcon(
                boxColor: ColorsManager.surfaceSecondary,
                assetPath: Assets.assetsImagesIconsEdit,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
