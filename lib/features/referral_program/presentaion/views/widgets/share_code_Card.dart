import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_button_widget.dart';
import 'package:barq_go/core/widgets/app_svg_handler.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

class ShareCodeCard extends StatelessWidget {
  const ShareCodeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),

      child: Container(
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: ColorsManager.surfacePrimary,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24.r),
            bottomRight: Radius.circular(24.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "your_invite_code".tr(),
              style: TextStyles.textStyleSemiBold11.copyWith(
                color: ColorsManager.textSecondary,
              ),
            ),
            10.verticalSpace,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: ColorsManager.background,
                border: DashedBorder.fromBorderSide(
                  dashLength: 10,
                  side: BorderSide(
                    color: ColorsManager.brandPrimary,
                    width: 3.w,
                  ),
                ),
                borderRadius: BorderRadius.all(Radius.circular(12.r)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      "BARQM47",
                      style: TextStyles.textStyleExtraBold26,
                    ),
                  ),
                  Expanded(
                    child: AppButtonWidget(
                      text: "copy",
                      backgroundColor: ColorsManager.darkBackground,
                      textColor: ColorsManager.brandPrimary,
                      icon: AppSvgHandler(
                        assetPath: Assets.assetsImagesIconsCopy,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            16.verticalSpace,
            AppButtonWidget(
              text: "share_code",
              icon: AppSvgHandler(assetPath: Assets.assetsImagesIconsShare),
            ),
            16.verticalSpace,
            Row(
              children: List.generate(3, (index) {
                return Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "transaction_amount".tr(),
                        style: TextStyles.textStyleExtraBold17,
                      ),
                      4.verticalSpace,
                      Text(
                        "earned".tr(),
                        style: TextStyles.textStyleRegular11.copyWith(
                          color: ColorsManager.textSecondary,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
