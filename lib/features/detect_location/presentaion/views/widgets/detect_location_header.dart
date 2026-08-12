import 'package:barq_go/core/helper/extensions.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetectLocationHeader extends StatelessWidget {
  const DetectLocationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            context.pop();
          },
          child: Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorsManager.surfacePrimary,
            ),
            child: Icon(Icons.arrow_back_ios_new, size: 20.sp),
          ),
        ),
        12.horizontalSpace,
        Container(
          width: MediaQuery.of(context).size.width * 0.77,
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: ColorsManager.surfacePrimary,
          ),
          child: Text(
            "select_pickup_location".tr(),
            style: TextStyles.textStyleBold15,
          ),
        ),
      ],
    );
  }
}
