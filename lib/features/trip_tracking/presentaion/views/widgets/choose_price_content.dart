import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_button_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChoosePriceContent extends StatefulWidget {
  const ChoosePriceContent({super.key, required this.onSendRequest});

  final ValueChanged<int> onSendRequest;

  @override
  State<ChoosePriceContent> createState() => _ChoosePriceContentState();
}

class _ChoosePriceContentState extends State<ChoosePriceContent> {
  int amount = 1800;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
            color: ColorsManager.surfaceSecondary,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "suggested_price".tr(),
                    style: TextStyles.textStyleRegular12.copyWith(
                      color: ColorsManager.textSecondary,
                    ),
                  ),

                  2.horizontalSpace,

                  Text(
                    "transaction_amount".tr(),
                    style: TextStyles.textStyleRegular12.copyWith(
                      color: ColorsManager.brandPrimary,
                    ),
                  ),

                  const Spacer(),

                  Text(
                    "good".tr(),
                    style: TextStyles.textStyleSemiBold12.copyWith(
                      color: ColorsManager.brandPrimary,
                    ),
                  ),
                ],
              ),

              12.verticalSpace,

              Row(
                children: [
                  Expanded(
                    child: AppButtonWidget(
                      text: "+",
                      backgroundColor: ColorsManager.surfacePrimary,
                      onTap: () {
                        setState(() {
                          amount += 200;
                        });
                      },
                    ),
                  ),

                  Expanded(
                    flex: 3,
                    child: Text(
                      "$amount ${"kwd".tr()}",
                      style: TextStyles.textStyleBold30,
                      textAlign: TextAlign.center,
                    ),
                  ),

                  Expanded(
                    child: AppButtonWidget(
                      text: "-",
                      backgroundColor: ColorsManager.surfacePrimary,
                      onTap: () {
                        if (amount > 200) {
                          setState(() {
                            amount -= 200;
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        16.verticalSpace,

        AppButtonWidget(
          text: "send_request",
          textColor: ColorsManager.surfacePrimary,
          onTap: () => widget.onSendRequest(amount),
        ),
      ],
    );
  }
}
