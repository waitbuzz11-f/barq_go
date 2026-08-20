import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_svg_handler.dart';
import 'package:barq_go/core/widgets/box_shape_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileOptionsItem extends StatelessWidget {
  const ProfileOptionsItem({
    super.key,
    required this.assetPath,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });

  final String assetPath;
  final String title;
  final String subTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final bool isArabic = context.locale.languageCode == "ar";
    final bool isLogout = title == "logout";

    const Color logoutColor = Color(0xFFDC2626);

    final borderRadius = BorderRadius.circular(16.r);

    return Material(
      color: isLogout
          ? logoutColor.withValues(alpha: 0.08)
          : ColorsManager.surfacePrimary,
      borderRadius: borderRadius,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            border: isLogout ? Border.all(color: logoutColor, width: 1) : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isLogout
                  ? Container(
                      width: 40.r,
                      height: 40.r,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: logoutColor.withValues(alpha: 0.12),
                      ),
                      child: AppSvgHandler(assetPath: assetPath),
                    )
                  : BoxShapeIcon(
                      boxColor: ColorsManager.surfaceSecondary,
                      assetPath: assetPath,
                    ),

              12.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.tr(),
                    style: TextStyles.textStyleSemiBold14.copyWith(
                      color: isLogout ? logoutColor : null,
                    ),
                  ),
                  if (subTitle.isNotEmpty) ...[
                    4.verticalSpace,
                    Text(
                      subTitle.tr(),
                      style: TextStyles.textStyleSemiBold12.copyWith(
                        color: ColorsManager.textSecondary,
                      ),
                    ),
                  ],
                ],
              ),

              12.horizontalSpace,

              if (!isLogout)
                Transform.scale(
                  scaleX: isArabic ? -1 : 1,
                  child: AppSvgHandler(
                    assetPath: Assets.assetsImagesIconsArrBackRight,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
