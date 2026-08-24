import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_svg_handler.dart';
import 'package:barq_go/core/widgets/box_shape_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrackPackageContent extends StatelessWidget {
  const TrackPackageContent({super.key});

  @override
  Widget build(BuildContext context) {
    const activeStep = 2;

    final List<String> steps = [
      "driver_on_the_way_to_you",
      "package_received",
      "package_on_the_way",
      "driver_approaching_receiver",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _DriverCard(),

        24.verticalSpace,

        Text("track_package".tr(), style: TextStyles.textStyleBold15),

        16.verticalSpace,

        EasyStepper(
          activeStep: activeStep,

          direction: Axis.vertical,

          verticalAlignment: CrossAxisAlignment.start,

          verticalTitlePlacement: VerticalTitlePlacement.side,

          showLoadingAnimation: false,
          showStepBorder: false,

          stepRadius: 14.r,

          internalPadding: 0,

          activeStepTextColor: ColorsManager.textPrimary,
          finishedStepTextColor: ColorsManager.textPrimary,
          unreachedStepTextColor: ColorsManager.textSecondary,

          lineStyle: LineStyle(
            lineLength: 50.h,
            lineThickness: 2,
            lineType: LineType.normal,
            unreachedLineType: LineType.normal,
            defaultLineColor: ColorsManager.border,
            finishedLineColor: ColorsManager.brandPrimary,
            activeLineColor: ColorsManager.brandPrimary,
            unreachedLineColor: ColorsManager.border,
          ),

          steps: List.generate(steps.length, (index) {
            final isCompleted = index < activeStep;
            final isActive = index == activeStep;
            final isReached = index <= activeStep;

            return EasyStep(
              customStep: _StepCircle(
                isCompleted: isCompleted,
                isActive: isActive,
              ),

              customTitle: Text(
                steps[index].tr(),
                style: TextStyles.textStyleSemiBold12.copyWith(
                  color: isReached
                      ? ColorsManager.textPrimary
                      : ColorsManager.textSecondary,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _DriverCard extends StatelessWidget {
  const _DriverCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.surfaceSecondary,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
        leading: BoxShapeIcon(
          boxColor: ColorsManager.border,
          assetPath: Assets.assetsImagesIconsProfile,
        ),
        title: Text("محمد الراشد", style: TextStyles.textStyleBold14),
        subtitle: Text(
          "دراجة توصيل",
          style: TextStyles.textStyleBold14.copyWith(
            color: ColorsManager.textSecondary,
          ),
        ),
        trailing: AppSvgHandler(
          assetPath: Assets.assetsImagesIconsChat,
          color: ColorsManager.brandPrimary,
        ),
      ),
    );
  }
}

class _StepCircle extends StatelessWidget {
  const _StepCircle({required this.isCompleted, required this.isActive});

  final bool isCompleted;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final bool isSelected = isCompleted || isActive;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 28.w,
      height: 28.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected
            ? ColorsManager.brandPrimary
            : ColorsManager.surfacePrimary,
        border: Border.all(
          color: isSelected ? ColorsManager.brandPrimary : ColorsManager.border,
          width: 2,
        ),
      ),
      child: isCompleted
          ? Icon(Icons.check, size: 16.sp, color: ColorsManager.surfacePrimary)
          : isActive
          ? Container(
              width: 7.w,
              height: 7.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ColorsManager.surfacePrimary,
              ),
            )
          : null,
    );
  }
}
