import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderSummaryItem extends StatelessWidget {
  const OrderSummaryItem({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyles.textStyleRegular13.copyWith(
              color: ColorsManager.textSecondary,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 200.w,
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyles.textStyleBold13.copyWith(
                color: ColorsManager.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
