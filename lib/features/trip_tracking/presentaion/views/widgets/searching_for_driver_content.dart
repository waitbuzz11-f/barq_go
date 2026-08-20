import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_svg_handler.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchingForDriverContent extends StatelessWidget {
  const SearchingForDriverContent({super.key, required this.onCancel});

  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: ColorsManager.brandPrimary,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: AppSvgHandler(
            assetPath: Assets.assetsImagesLogo,
            width: 22.w,
            height: 28.h,
          ),
        ),
        36.verticalSpace,
        Text("searching_for_driver".tr(), style: TextStyles.textStyleBold16),
        16.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "suggested_price".tr(),
              style: TextStyles.textStyleRegular13.copyWith(
                color: ColorsManager.textSecondary,
              ),
            ),
            2.horizontalSpace,
            Text(
              "transaction_amount".tr(),
              style: TextStyles.textStyleRegular13.copyWith(
                color: ColorsManager.brandPrimary,
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: onCancel,
          child: Text(
            "cancel_search".tr(),
            style: TextStyles.textStyleExtraBold13.copyWith(
              color: ColorsManager.danger,
            ),
          ),
        ),
      ],
    );
  }
}
