import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_button_widget.dart';
import 'package:barq_go/core/widgets/app_svg_handler.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TripDetailsContent extends StatelessWidget {
  const TripDetailsContent({super.key, required this.onChooseVehicleType});

  final VoidCallback onChooseVehicleType;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: ColorsManager.surfaceSecondary,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  AppSvgHandler(
                    assetPath: Assets.assetsImagesIconsCircle,
                    color: ColorsManager.brandPrimary,
                  ),
                  2.horizontalSpace,
                  Text(
                    "home_address".tr(),
                    style: TextStyles.textStyleRegular13,
                  ),
                ],
              ),
              4.verticalSpace,
              SizedBox(
                height: 16.h,
                child: VerticalDivider(
                  color: ColorsManager.textSecondary,
                  thickness: 1.w,
                  width: 12.w,
                ),
              ),
              Row(
                children: [
                  AppSvgHandler(
                    assetPath: Assets.assetsImagesIconsCircle,
                    color: ColorsManager.darkBackground,
                  ),
                  2.horizontalSpace,
                  Text(
                    "hawally_street_17".tr(),
                    style: TextStyles.textStyleRegular11.copyWith(
                      color: ColorsManager.textSecondary,
                    ),
                  ),
                ],
              ),
              12.verticalSpace,
              Row(
                children: [
                  AppSvgHandler(
                    assetPath: Assets.assetsImagesIconsLocation,
                    color: ColorsManager.darkBackground,
                  ),
                  2.horizontalSpace,
                  Text(
                    "11.4 ${"km".tr()}",
                    style: TextStyles.textStyleRegular11.copyWith(
                      color: ColorsManager.textSecondary,
                    ),
                  ),
                  8.horizontalSpace,
                  AppSvgHandler(
                    assetPath: Assets.assetsImagesIconsTime,
                    color: ColorsManager.darkBackground,
                  ),
                  2.horizontalSpace,
                  Text(
                    "~26 ${"minutes_short".tr()}",
                    style: TextStyles.textStyleRegular11.copyWith(
                      color: ColorsManager.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        16.verticalSpace,
        AppButtonWidget(
          text: "choose_vehicle_type",
          textColor: ColorsManager.surfacePrimary,
          onTap: onChooseVehicleType,
        ),
      ],
    );
  }
}
