import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_button_widget.dart';
import 'package:barq_go/core/widgets/app_svg_handler.dart';
import 'package:barq_go/core/widgets/box_shape_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DriverOffersContent extends StatelessWidget {
  const DriverOffersContent({super.key, this.onOfferAccepted});

  final ValueChanged<int>? onOfferAccepted;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 3,
      separatorBuilder: (context, index) {
        return 8.verticalSpace;
      },
      itemBuilder: (context, index) {
        return DriverOfferCard(
          isSimilar: index == 0,
          onAccepted: () => onOfferAccepted?.call(index),
        );
      },
    );
  }
}

class DriverOfferCard extends StatelessWidget {
  const DriverOfferCard({
    super.key,
    required this.isSimilar,
    required this.onAccepted,
  });

  final bool isSimilar;
  final VoidCallback onAccepted;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: isSimilar
            ? ColorsManager.brandPrimary.withAlpha(7)
            : ColorsManager.surfaceSecondary,
        border: Border.all(
          color: isSimilar
              ? ColorsManager.brandPrimary
              : ColorsManager.darkInput.withAlpha(6),
        ),
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

                        8.horizontalSpace,

                        Text(
                          "2.500 ${"kwd".tr()}",
                          style: TextStyles.textStyleBold18.copyWith(
                            color: ColorsManager.brandPrimary,
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
                          "4.8 • 3 ${"minutes_short".tr()}",
                          style: TextStyles.textStyleRegular12.copyWith(
                            color: ColorsManager.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          16.verticalSpace,

          AppButtonWidget(
            text: "accept_offer",
            textColor: ColorsManager.surfacePrimary,
            onTap: onAccepted,
          ),
        ],
      ),
    );
  }
}
