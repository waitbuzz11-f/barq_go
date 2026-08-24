import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_button_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliveryFeeContent extends StatelessWidget {
  const DeliveryFeeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(color: ColorsManager.surfaceSecondary),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "delivery_fee".tr(),
                    style: TextStyles.textStyleRegular13.copyWith(
                      color: ColorsManager.textSecondary,
                    ),
                  ),
                  Text(
                    "transaction_amount".tr(),
                    style: TextStyles.textStyleBold22.copyWith(
                      color: ColorsManager.brandPrimary,
                    ),
                  ),
                ],
              ),
              16.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "~18 ${"minutes_short".tr()}",
                    style: TextStyles.textStyleRegular13.copyWith(
                      color: ColorsManager.textSecondary,
                    ),
                  ),
                  Text(
                    "fast".tr(),
                    style: TextStyles.textStyleRegular13.copyWith(
                      color: ColorsManager.success,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        16.verticalSpace,
        AppButtonWidget(
          text: "request_delivery",
          textColor: ColorsManager.surfacePrimary,
        ),
      ],
    );
  }
}
