import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TripStatics extends StatelessWidget {
  const TripStatics({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TripStaticsCard(
          title: "completed_trips",
          value: "20",
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        12.horizontalSpace,
        TripStaticsCard(
          title: "total_spending",
          value: "1000",
          crossAxisAlignment: CrossAxisAlignment.end,
        ),
      ],
    );
  }
}

class TripStaticsCard extends StatelessWidget {
  const TripStaticsCard({
    super.key,
    required this.value,
    required this.title,
    required this.crossAxisAlignment,
  });
  final String value;
  final String title;
  final CrossAxisAlignment crossAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: ColorsManager.surfacePrimary,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: crossAxisAlignment,
          children: [
            Text("$value", style: TextStyles.textStyleBold17),
            2.verticalSpace,
            Text("$title".tr(), style: TextStyles.textStyleRegular11),
          ],
        ),
      ),
    );
  }
}
