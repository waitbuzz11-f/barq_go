import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_svg_handler.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MassegeShareLink extends StatelessWidget {
  const MassegeShareLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: ColorsManager.brandPrimary.withAlpha(7),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          Text(
            "trusted_contacts_tracking_link".tr(),
            style: TextStyles.textStyleRegular13.copyWith(
              color: ColorsManager.textSecondary,
            ),
          ),
          15.horizontalSpace,
          AppSvgHandler(assetPath: Assets.assetsImagesIconsPrivacy),
        ],
      ),
    );
  }
}
