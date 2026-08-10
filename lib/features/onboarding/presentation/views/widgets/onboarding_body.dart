import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/widgets/app_svg_handler.dart';
import 'package:barq_go/features/onboarding/data/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({
    super.key,
    required this.onboardingModel,
  });

  final OnboardingModel onboardingModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppSvgHandler(
          assetPath: onboardingModel.imgPath,
        ),

        32.verticalSpace,

        Text(
          onboardingModel.title,
          textAlign: TextAlign.center,
          style: TextStyles.textStyleExtraBold30,
        ),

        14.verticalSpace,

        Text(
          onboardingModel.description,
          textAlign: TextAlign.center,
          style: TextStyles.textStyleRegular16,
        ),
      ],
    );
  }
}