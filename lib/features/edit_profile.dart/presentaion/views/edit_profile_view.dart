import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_button_widget.dart';
import 'package:barq_go/core/widgets/app_text_field.dart';
import 'package:barq_go/core/widgets/custom_app_bar.dart';
import 'package:barq_go/core/widgets/profile_image_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'personal_information'),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: ProfileImageCard()),
            12.verticalSpace,
            Center(
              child: Text(
                "change_photo".tr(),
                style: TextStyles.textStyleRegular13.copyWith(
                  color: ColorsManager.brandPrimary,
                ),
              ),
            ),
            20.verticalSpace,
            // 1
            Text(
              "full_name".tr(),
              style: TextStyles.textStyleSemiBold13.copyWith(
                color: ColorsManager.textSecondary,
              ),
            ),
            6.verticalSpace,
            AppTextFormField(hintText: 'full_name_hint'.tr()),
            // 2
            Text(
              "phone_number".tr(),
              style: TextStyles.textStyleSemiBold13.copyWith(
                color: ColorsManager.textSecondary,
              ),
            ),
            6.verticalSpace,
            AppTextFormField(hintText: 'phone_number_hint'.tr()),
            // 3
            Text(
              "email".tr(),
              style: TextStyles.textStyleSemiBold13.copyWith(
                color: ColorsManager.textSecondary,
              ),
            ),
            6.verticalSpace,
            AppTextFormField(hintText: 'email_hint'.tr()),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.all(16.r),
        child: AppButtonWidget(
          text: "save_changes",
          textColor: ColorsManager.surfacePrimary,
        ),
      ),
    );
  }
}
