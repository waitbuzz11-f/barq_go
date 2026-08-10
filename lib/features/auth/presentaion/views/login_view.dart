import 'package:barq_go/core/helper/extensions.dart';
import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/routing/routes.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_button_widget.dart';
import 'package:barq_go/core/widgets/app_svg_handler.dart';
import 'package:barq_go/features/auth/presentaion/views/widgets/phone_field_widget.dart';
import 'package:barq_go/features/auth/presentaion/views/widgets/service_and_condition.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.darkBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          95.verticalSpace,
          Container(
            padding: EdgeInsets.all(14.r),
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              color: ColorsManager.brandPrimary,
              borderRadius: BorderRadius.circular(18.r),
            ),
            child: AppSvgHandler(assetPath: Assets.assetsImagesIconsM),
          ),
          32.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              'welcome_to_barq_go'.tr().replaceFirst(' Barq Go', '\nBarq Go'),
              style: TextStyles.textStyleExtraBold32.copyWith(
                color: ColorsManager.surfacePrimary,
              ),
            ),
          ),
          10.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              "enter_phone_to_continue".tr(),
              style: TextStyles.textStyleRegular14.copyWith(
                color: ColorsManager.surfacePrimary.withAlpha(40),
              ),
            ),
          ),
          39.verticalSpace,
          PhoneFieldWidget(),
          Center(child: ServiceAndCondition()),
        ],
      ),
      bottomNavigationBar: Container(
        color: ColorsManager.darkSurface,

        padding: EdgeInsets.all(16.r),
        child: SafeArea(
          top: false,
          child: AppButtonWidget(
            text: "send_verfication_code".tr(),
            onTap: () {
              context.pushNamed(Routes.otp);
            },
          ),
        ),
      ),
    );
  }
}
