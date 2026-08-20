import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_svg_handler.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InviteFriendCard extends StatelessWidget {
  const InviteFriendCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 28.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(Assets.assetsImagesPngOnboardingScreen),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 64.w,
            height: 64.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ColorsManager.darkLight.withAlpha(20),
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: AppSvgHandler(assetPath: Assets.assetsImagesPrize),
          ),

          16.verticalSpace,

          Text(
            "invite_friends_earn_credit".tr(),
            textAlign: TextAlign.center,
            style: TextStyles.textStyleExtraBold22,
          ),

          8.verticalSpace,

          Text(
            "invite_friends_earn_credit_desc".tr(),
            textAlign: TextAlign.center,
            style: TextStyles.textStyleRegular18.copyWith(
              color: ColorsManager.textSecondary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
