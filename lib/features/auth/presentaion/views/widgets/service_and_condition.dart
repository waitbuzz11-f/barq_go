import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ServiceAndCondition extends StatelessWidget {
  const ServiceAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: ColorsManager.darkSurface),
      child: Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          children: [
            TextSpan(
              text: "by_continuing_you_agree".tr(),
              style: TextStyles.textStyleRegular11.copyWith(
                color: ColorsManager.surfacePrimary.withAlpha(30),
              ),
            ),
            TextSpan(
              text: "terms_of_use".tr(),
              style: TextStyles.textStyleRegular11.copyWith(
                color: ColorsManager.brandPrimary,
              ),
            ),
            TextSpan(
              text: "and".tr(),
              style: TextStyles.textStyleRegular11.copyWith(
                color: ColorsManager.surfacePrimary.withAlpha(30),
              ),
            ),
            TextSpan(
              text: "privacy_policy".tr(),
              style: TextStyles.textStyleRegular11.copyWith(
                color: ColorsManager.brandPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
