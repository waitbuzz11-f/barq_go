import 'package:barq_go/core/helper/extensions.dart';
import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_button_widget.dart';
import 'package:barq_go/core/widgets/app_svg_handler.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddBalanceStatus extends StatelessWidget {
  const AddBalanceStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppSvgHandler(assetPath: Assets.assetsImagesIconsSuccess),
            24.verticalSpace,
            Text(
              "wallet_recharged_successfully".tr(),
              style: TextStyles.textStyleBold26,
              textAlign: TextAlign.center,
            ),
            24.verticalSpace,
            Text(
              "balance_added_successfully".tr(),
              style: TextStyles.textStyleRegular15,
              textAlign: TextAlign.center,
            ),
            24.verticalSpace,
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: ColorsManager.surfaceSecondary,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "new_balance".tr(),
                    style: TextStyles.textStyleRegular13,
                  ),
                  4.horizontalSpace,
                  Text(
                    "transaction_amount".tr(),
                    style: TextStyles.textStyleBold18,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.all(16.r),
        child: AppButtonWidget(
          text: "back_to_wallet".tr(),
          textColor: ColorsManager.surfacePrimary,
          onTap: () {
            context.pop();
          },
        ),
      ),
    );
  }
}
