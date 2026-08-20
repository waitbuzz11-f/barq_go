import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_button_widget.dart';
import 'package:barq_go/core/widgets/app_svg_handler.dart';
import 'package:barq_go/core/widgets/app_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfuirmLocationContent extends StatelessWidget {
  const ConfuirmLocationContent({super.key, required this.onConfirm});

  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
        color: ColorsManager.surfacePrimary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextFormField(
            hintText: 'detect_your_location'.tr(),
            suffixIcon: AppSvgHandler(
              assetPath: Assets.assetsImagesIconsCircle,
            ),
          ),
          12.verticalSpace,
          Text(
            "move_map_to_select_location".tr(),
            style: TextStyles.textStyleRegular12,
          ),
          12.verticalSpace,
          AppButtonWidget(
            text: "confirm_pickup_location",
            textColor: ColorsManager.surfacePrimary,
            onTap: onConfirm,
          ),
        ],
      ),
    );
  }
}
