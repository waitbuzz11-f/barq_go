import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_button_widget.dart';
import 'package:barq_go/core/widgets/app_text_field.dart';
import 'package:barq_go/features/trip_tracking/presentaion/views/widgets/order_summary_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProviderVerficationContent extends StatelessWidget {
  const ProviderVerficationContent({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
      {"title": "name".tr(), "value": "transport_company_name".tr()},
      {"title": "company".tr(), "value": "transport_company".tr()},
      {"title": "rating".tr(), "value": "4.8 ⭐"},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("provider_verification".tr(), style: TextStyles.textStyleBold15),

        8.verticalSpace,

        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: ColorsManager.surfaceSecondary,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: ColorsManager.border),
          ),
          child: Column(
            children: items
                .map(
                  (item) => OrderSummaryItem(
                    title: item["title"]!,
                    value: item["value"]!,
                  ),
                )
                .toList(),
          ),
        ),

        16.verticalSpace,
        Text(
          "enter_verification_pin".tr(),
          style: TextStyles.textStyleRegular12.copyWith(
            color: ColorsManager.textSecondary,
          ),
        ),
        8.verticalSpace,
        AppTextFormField(hintText: "enter_verification_pin".tr()),
        16.verticalSpace,
        AppButtonWidget(
          text: "confirm_and_start_service",
          textColor: ColorsManager.surfacePrimary,
        ),
      ],
    );
  }
}
