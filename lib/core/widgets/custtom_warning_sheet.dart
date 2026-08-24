import 'package:barq_go/core/helper/extensions.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_button_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomWarningSheet extends StatelessWidget {
  const CustomWarningSheet({
    super.key,
    required this.title,
    required this.subTitle,
    required this.confuirmButtonTitle,
  });
  final String title, subTitle, confuirmButtonTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: ColorsManager.surfacePrimary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title.tr(), style: TextStyles.textStyleBold18),
          8.verticalSpace,
          Text(
            subTitle.tr(),
            style: TextStyles.textStyleRegular14.copyWith(
              color: ColorsManager.textSecondary,
            ),
          ),
          16.verticalSpace,
          AppButtonWidget(
            text: confuirmButtonTitle,
            backgroundColor: ColorsManager.danger,
            textColor: ColorsManager.surfacePrimary,
          ),
          8.verticalSpace,
          AppButtonWidget(
            text: "cancel",
            backgroundColor: ColorsManager.surfaceSecondary,
            onTap: () {
              context.pop();
            },
          ),
        ],
      ),
    );
  }
}
