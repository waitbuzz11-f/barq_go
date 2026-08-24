import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/box_shape_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WalletCardData extends StatelessWidget {
  const WalletCardData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.r),
      decoration: BoxDecoration(
        color: ColorsManager.brandPrimary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "wallet_balance".tr(),
                    style: TextStyles.textStyleSemiBold11.copyWith(
                      color: ColorsManager.darkLight.withAlpha(50),
                    ),
                  ),
                  4.verticalSpace,
                  Text(
                    "8.750 ${"kwd".tr()}",
                    style: TextStyles.textStyleExtraBold36,
                  ),
                ],
              ),
              const Spacer(),
              BoxShapeIcon(
                paddingValue: 16,
                boxColor: ColorsManager.darkLight.withAlpha(10),
                assetPath: Assets.assetsImagesIconsM,
              ),
            ],
          ),

          8.verticalSpace,

          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "barq 1234",
              style: TextStyles.textStyleSemiBold11.copyWith(
                color: ColorsManager.darkLight.withAlpha(50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
