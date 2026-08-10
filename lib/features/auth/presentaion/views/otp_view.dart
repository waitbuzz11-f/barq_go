import 'package:barq_go/core/helper/extensions.dart';
import 'package:barq_go/core/routing/routes.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_button_widget.dart';
import 'package:barq_go/features/auth/presentaion/views/widgets/change_phone_widget.dart';
import 'package:barq_go/features/auth/presentaion/views/widgets/otp_field_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.darkBackground,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: ChangePhoneWidget(),
            ),
            12.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'enter_verification_code'.tr().replaceFirst(' code', '\ncode'),
                style: TextStyles.textStyleExtraBold30.copyWith(
                  color: ColorsManager.surfacePrimary,
                ),
              ),
            ),
            12.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'sent_to'.tr(),
                      style: TextStyles.textStyleRegular13.copyWith(
                        color: ColorsManager.surfacePrimary.withAlpha(40),
                      ),
                    ),
                    TextSpan(
                      text: " ${'phone_ex'.tr()}",
                      style: TextStyles.textStyleSemiBold13.copyWith(
                        color: ColorsManager.brandPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            35.verticalSpace,
            OtpFieldWidget(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: ColorsManager.darkSurface,

        padding: EdgeInsets.all(16.r),
        child: SafeArea(
          top: false,
          child: AppButtonWidget(
            text: "confirm_code".tr(),
            onTap: () {
              context.pushNamed(Routes.locationPolicy);
            },
          ),
        ),
      ),
    );
  }
}
