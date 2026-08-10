import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/features/onboarding/data/dummy_data/dummy_data.dart';
import 'package:barq_go/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:barq_go/features/onboarding/presentation/views/widgets/onboarding_body.dart';
import 'package:barq_go/features/onboarding/presentation/views/widgets/onboarding_footer.dart';
import 'package:barq_go/features/onboarding/presentation/views/widgets/onboarding_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.assetsImagesPngOnboardingScreen),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: BlocBuilder<OnboardingCubit, int>(
                builder: (context, currentIndex) {
                  final cubit = context.read<OnboardingCubit>();

                  return Column(
                    children: [
                      OnboardingHeader(currentIndex: currentIndex),

                      24.verticalSpace,

                      Expanded(
                        child: PageView.builder(
                          controller: cubit.pageController,
                          itemCount: dummyData.length,
                          onPageChanged: cubit.onPageChanged,
                          itemBuilder: (context, index) {
                            return OnboardingBody(
                              onboardingModel: dummyData[index],
                            );
                          },
                        ),
                      ),

                      const OnboardingFooter(),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
