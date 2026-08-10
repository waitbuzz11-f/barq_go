import 'package:barq_go/core/helper/extensions.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePhoneWidget extends StatelessWidget {
  const ChangePhoneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            context.pop();
          },
          child: Container(
            padding: EdgeInsets.all(9.r),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ColorsManager.surfacePrimary.withAlpha(8),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 18.sp,
              color: ColorsManager.surfacePrimary,
            ),
          ),
        ),
        8.horizontalSpace,
        Text(
          "change_phone_number".tr(),
          style: TextStyles.textStyleSemiBold13.copyWith(
            color: ColorsManager.surfacePrimary.withAlpha(50),
          ),
        ),
      ],
    );
  }
}
