import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_svg_handler.dart';
import 'package:barq_go/core/widgets/box_shape_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MapHeader extends StatelessWidget {
  const MapHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: ColorsManager.surfacePrimary,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppSvgHandler(assetPath: Assets.assetsImagesIconsLocation),
                    4.horizontalSpace,
                    Text(
                      'your_current_location'.tr(),
                      style: TextStyles.textStyleRegular11.copyWith(
                        color: ColorsManager.textSecondary,
                      ),
                    ),
                  ],
                ),
                4.verticalSpace,
                Text('salmiya_kuwait'.tr(), style: TextStyles.textStyleBold14),
              ],
            ),
          ),
          12.horizontalSpace,
          BoxShapeIcon(
            boxColor: ColorsManager.surfaceSecondary,
            assetPath: Assets.assetsImagesIconsNotification,
          ),
          10.horizontalSpace,
          BoxShapeIcon(
            boxColor: ColorsManager.surfaceSecondary,
            assetPath: Assets.assetsImagesIconsProfile,
          ),
        ],
      ),
    );
  }
}
