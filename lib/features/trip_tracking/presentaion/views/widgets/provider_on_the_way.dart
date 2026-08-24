import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_button_widget.dart';
import 'package:barq_go/core/widgets/app_svg_handler.dart';
import 'package:barq_go/core/widgets/box_shape_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProviderOnTheWay extends StatelessWidget {
  const ProviderOnTheWay({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: ColorsManager.surfaceSecondary,
            border: Border.all(color: ColorsManager.darkInput.withAlpha(6)),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BoxShapeIcon(
                boxColor: ColorsManager.border,
                assetPath: Assets.assetsImagesPackege,
              ),

              12.horizontalSpace,

              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "transport_company_name".tr(),
                      style: TextStyles.textStyleBold14,
                    ),

                    4.verticalSpace,

                    Text(
                      "provider_heading_to_vehicle".tr(),
                      style: TextStyles.textStyleRegular12.copyWith(
                        color: ColorsManager.textSecondary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),

              12.horizontalSpace,

              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "3",
                    style: TextStyles.textStyleBold22.copyWith(
                      color: ColorsManager.brandPrimary,
                    ),
                  ),
                  Text(
                    "minutes_short".tr(),
                    style: TextStyles.textStyleRegular11.copyWith(
                      color: ColorsManager.textSecondary,
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
        ),

        16.verticalSpace,

        Row(
          children: [
            Expanded(
              child: AppButtonWidget(
                text: "chat",
                icon: AppSvgHandler(assetPath: Assets.assetsImagesIconsChat),
                textColor: ColorsManager.darkBackground,
                backgroundColor: ColorsManager.surfaceSecondary,
                borderColor: ColorsManager.border,
              ),
            ),

            8.horizontalSpace,

            Expanded(
              child: AppButtonWidget(
                text: "call",
                icon: AppSvgHandler(assetPath: Assets.assetsImagesIconsCall),
                textColor: ColorsManager.darkBackground,
                backgroundColor: ColorsManager.surfaceSecondary,
                borderColor: ColorsManager.border,
              ),
            ),

            8.horizontalSpace,

            Expanded(
              child: AppButtonWidget(
                text: "share",
                icon: AppSvgHandler(assetPath: Assets.assetsImagesIconsShare),
                textColor: ColorsManager.darkBackground,
                backgroundColor: ColorsManager.surfaceSecondary,
                borderColor: ColorsManager.border,
              ),
            ),
          ],
        ),
        16.verticalSpace,
        AppButtonWidget(
          text: "provider_arrived_verification",
          textColor: ColorsManager.surfacePrimary,
        ),
      ],
    );
  }
}
