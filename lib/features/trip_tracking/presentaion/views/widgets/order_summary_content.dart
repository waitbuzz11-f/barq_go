import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_button_widget.dart';
import 'package:barq_go/features/trip_tracking/presentaion/views/widgets/order_summary_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderSummaryContent extends StatelessWidget {
  const OrderSummaryContent({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
      {"title": "service".tr(), "value": "car_transport".tr()},
      {"title": "appointment".tr(), "value": "now".tr()},
      {"title": "from".tr(), "value": "حولي، شارع 17، الكويت"},
      {"title": "to".tr(), "value": "مركز الأفنيوز"},
      {"title": "vehicle".tr(), "value": "standard_flatbed".tr()},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("order_summary".tr(), style: TextStyles.textStyleBold15),
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

        AppButtonWidget(
          text: "next_set_price",
          textColor: ColorsManager.surfacePrimary,
        ),
      ],
    );
  }
}

