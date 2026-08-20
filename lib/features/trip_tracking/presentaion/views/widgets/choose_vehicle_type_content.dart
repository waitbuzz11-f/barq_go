import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_button_widget.dart';
import 'package:barq_go/core/widgets/app_svg_handler.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseVehicleTypeContent extends StatefulWidget {
  const ChooseVehicleTypeContent({super.key, required this.onNext});

  final ValueChanged<int> onNext;

  @override
  State<ChooseVehicleTypeContent> createState() =>
      _ChooseVehicleTypeContentState();
}

class _ChooseVehicleTypeContentState extends State<ChooseVehicleTypeContent> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemCount: 2,
            separatorBuilder: (context, index) => 8.verticalSpace,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    currentIndex = index;
                  });
                },
                borderRadius: BorderRadius.circular(16.r),
                child: VehicleTypeCard(isSelected: currentIndex == index),
              );
            },
          ),
        ),

        16.verticalSpace,

        AppButtonWidget(
          text: "next_set_price",
          textColor: ColorsManager.surfacePrimary,
          onTap: () => widget.onNext(currentIndex),
        ),
      ],
    );
  }
}

class VehicleTypeCard extends StatelessWidget {
  const VehicleTypeCard({super.key, required this.isSelected});
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: isSelected
            ? ColorsManager.brandPrimary.withAlpha(9)
            : ColorsManager.surfaceSecondary,
        border: Border.all(
          color: isSelected
              ? ColorsManager.brandPrimary
              : ColorsManager.darkInput.withAlpha(6),
        ),
      ),
      child: ListTile(
        leading: Image.asset(Assets.assetsImagesPngCarEx),
        title: Row(
          children: [
            Text("economy".tr(), style: TextStyles.textStyleSemiBold15),
            8.horizontalSpace,
            if (isSelected)
              Container(
                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 6.w),
                decoration: BoxDecoration(
                  color: ColorsManager.brandPrimary,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Text(
                  "selected".tr(),
                  style: TextStyles.textStyleBold10.copyWith(
                    color: ColorsManager.surfacePrimary,
                  ),
                ),
              ),
          ],
        ),
        subtitle: Row(
          children: [
            AppSvgHandler(
              assetPath: Assets.assetsImagesIconsTime,
              width: 11.w,
              height: 11.h,
            ),
            2.horizontalSpace,
            Text(
              "٦ د",
              style: TextStyles.textStyleSemiBold11.copyWith(
                color: ColorsManager.textSecondary,
              ),
            ),
            8.horizontalSpace,
            AppSvgHandler(
              assetPath: Assets.assetsImagesIconsProfile,
              width: 11.w,
              height: 11.h,
            ),
            2.horizontalSpace,
            Text(
              "4",
              style: TextStyles.textStyleSemiBold11.copyWith(
                color: ColorsManager.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
