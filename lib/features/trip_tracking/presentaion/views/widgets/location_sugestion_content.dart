import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_svg_handler.dart';
import 'package:barq_go/core/widgets/app_text_field.dart';
import 'package:barq_go/core/widgets/box_shape_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationSugestionContent extends StatelessWidget {
  const LocationSugestionContent({super.key, required this.onLocationSelected});

  final ValueChanged<int> onLocationSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextFormField(
          hintText: 'where_to'.tr(),
          prefixIcon: AppSvgHandler(
            assetPath: Assets.assetsImagesIconsCircle,
            color: ColorsManager.darkBackground,
          ),
        ),
        12.verticalSpace,
        Text(
          "suggestions".tr(),
          style: TextStyles.textStyleSemiBold12.copyWith(
            color: ColorsManager.textSecondary,
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => onLocationSelected(index),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Row(
                  children: [
                    BoxShapeIcon(
                      boxColor: ColorsManager.surfaceSecondary,
                      assetPath: Assets.assetsImagesIconsLocation,
                      assetColor: ColorsManager.darkBackground,
                    ),
                    12.horizontalSpace,
                    Text(
                      "location".tr(),
                      style: TextStyles.textStyleSemiBold14,
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(color: ColorsManager.darkLight.withAlpha(6));
          },
          itemCount: 3,
        ),
      ],
    );
  }
}
