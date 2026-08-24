import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_button_widget.dart';
import 'package:barq_go/core/widgets/app_svg_handler.dart';
import 'package:barq_go/core/widgets/box_shape_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DriverOnTheWayContent extends StatelessWidget {
  const DriverOnTheWayContent({
    super.key,
    required this.startTrip,
    required this.startChat,
  });
  final Function() startTrip, startChat;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: ColorsManager.surfaceSecondary,
            border: Border.all(color: ColorsManager.darkInput.withAlpha(6)),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BoxShapeIcon(
                    boxColor: ColorsManager.border,
                    assetPath: Assets.assetsImagesIconsProfile,
                  ),

                  12.horizontalSpace,

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("خالد المطيري", style: TextStyles.textStyleBold14),

                        4.verticalSpace,

                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "تويوتا كامري 2022 • أ ب ت • 1234",
                                style: TextStyles.textStyleRegular12.copyWith(
                                  color: ColorsManager.textSecondary,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),

                        6.verticalSpace,

                        Row(
                          children: [
                            AppSvgHandler(
                              assetPath: Assets.assetsImagesIconsStar,
                              width: 14.w,
                              height: 14.h,
                            ),

                            4.horizontalSpace,

                            Text(
                              "4.8",
                              style: TextStyles.textStyleRegular12.copyWith(
                                color: ColorsManager.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "3 ${"minutes_short".tr()}",
                        style: TextStyles.textStyleBold22.copyWith(
                          color: ColorsManager.brandPrimary,
                        ),
                      ),
                      Text(
                        "arrival_time".tr(),
                        style: TextStyles.textStyleRegular11.copyWith(
                          color: ColorsManager.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),

        16.verticalSpace,
        Row(
          children: [
            Expanded(
              child: AppButtonWidget(
                text: "start_trip",
                icon: AppSvgHandler(
                  assetPath: Assets.assetsImagesIconsStartTrip,
                ),
                textColor: ColorsManager.surfacePrimary,
                onTap: startTrip,
              ),
            ),
            8.horizontalSpace,
            Expanded(
              child: AppButtonWidget(
                text: "chat",
                icon: AppSvgHandler(assetPath: Assets.assetsImagesIconsChat),
                textColor: ColorsManager.darkBackground,
                backgroundColor: ColorsManager.surfaceSecondary,
                borderColor: ColorsManager.border,
                onTap: startChat,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
