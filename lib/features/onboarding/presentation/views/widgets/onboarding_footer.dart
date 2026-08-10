import 'package:barq_go/core/helper/extensions.dart';
import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/routing/routes.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_button_widget.dart';
import 'package:barq_go/core/widgets/app_svg_handler.dart';
import 'package:barq_go/features/onboarding/data/dummy_data/dummy_data.dart';
import 'package:barq_go/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingFooter extends StatelessWidget {
  const OnboardingFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, int>(
      builder: (context, currentIndex) {
        final cubit = context.read<OnboardingCubit>();
        final length = dummyData.length;
        final isLastPage = currentIndex == length - 1;

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 36.w,
                  height: 36.h,
                  padding: EdgeInsets.all(7.r),
                  decoration: BoxDecoration(
                    color: ColorsManager.darkLight.withAlpha(15),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: AppSvgHandler(
                    assetPath: Assets.assetsImagesLogo,
                    color: ColorsManager.darkLight,
                  ),
                ),
                12.horizontalSpace,
                Text('barq_go'.tr(), style: TextStyles.textStyleExtraBold18),
              ],
            ),
            24.verticalSpace,
            AppButtonWidget(
              backgroundColor: ColorsManager.darkBackground,
              textColor: ColorsManager.brandPrimary,
              text: isLastPage ? 'start_now'.tr() : 'next'.tr(),
              onTap: () {
                if (isLastPage) {
                  context.pushNamed(Routes.login);
                } else {
                  cubit.nextPage();
                }
              },
            ),
            16.verticalSpace,
            Text(
              '${currentIndex + 1} / $length',
              style: TextStyles.textStyleRegular13,
            ),
          ],
        );
      },
    );
  }
}
