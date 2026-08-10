import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_button_widget.dart';
import 'package:barq_go/features/onboarding/data/dummy_data/dummy_data.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingHeader extends StatelessWidget {
  const OnboardingHeader({super.key, required this.currentIndex});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppButtonWidget(
          width: 65.w,
          height: 32.h,
          text: 'skip'.tr(),
          backgroundColor: ColorsManager.darkLight.withAlpha(12),
          onTap: () {
            // Navigate
          },
        ),

        const Spacer(),

        Row(
          children: List.generate(dummyData.length, (index) {
            final isActive = index == currentIndex;

            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: EdgeInsets.only(left: 4.w),
              width: isActive ? 28.w : 8.w,
              height: 8.h,
              decoration: BoxDecoration(
                color: isActive
                    ? ColorsManager.darkLight.withAlpha(35)
                    : ColorsManager.darkLight.withAlpha(15),
                borderRadius: BorderRadius.circular(20.r),
              ),
            );
          }),
        ),
      ],
    );
  }
}
