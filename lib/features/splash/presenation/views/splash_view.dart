import 'package:barq_go/core/helper/extensions.dart';
import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/routing/routes.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_svg_handler.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        context.pushNamed(Routes.onboarding);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.brandPrimary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: AppSvgHandler(assetPath: Assets.assetsImagesLogo)),
              50.verticalSpace,
              Text('barq_go'.tr(), style: TextStyles.textStyleBold34),

              4.verticalSpace,

              Text(
                'your_ride_your_way'.tr(),
                style: TextStyles.textStyleRegular16,
              ),

              32.verticalSpace,

              FractionallySizedBox(
                widthFactor: 0.5,
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: LinearProgressIndicator(
                        value: _controller.value,
                        minHeight: 6.h,
                        backgroundColor: ColorsManager.darkLight.withAlpha(15),
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          ColorsManager.darkBackground,
                        ),
                      ),
                    );
                  },
                ),
              ),

              24.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
