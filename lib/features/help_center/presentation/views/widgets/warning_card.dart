import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_svg_handler.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WarningCard extends StatelessWidget {
  const WarningCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: ColorsManager.lightDanger.withAlpha(7),
        border: Border.all(color: ColorsManager.lightDanger),
      ),
      child: Row(
        children: [
          AppSvgHandler(assetPath: Assets.assetsImagesIconsError),
          4.horizontalSpace,
          Text(
            "emergency_safety_note".tr(),
            style: TextStyles.textStyleRegular13,
          ),
        ],
      ),
    );
  }
}
