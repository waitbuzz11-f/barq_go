import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseServiceTypeContent extends StatelessWidget {
  const ChooseServiceTypeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("choose_service_type".tr(), style: TextStyles.textStyleBold15),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 3,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8.r,
            mainAxisSpacing: 8.r,
            childAspectRatio: 1.3,
          ),
          itemBuilder: (context, index) {
            return const ServiceTypeCard();
          },
        ),
      ],
    );
  }
}

class ServiceTypeCard extends StatelessWidget {
  const ServiceTypeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: ColorsManager.surfaceSecondary,
        border: Border.all(color: ColorsManager.border),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Image.asset(Assets.assetsImagesPngCarEx),
          6.verticalSpace,
          Text("car_transport".tr(), style: TextStyles.textStyleSemiBold11),
        ],
      ),
    );
  }
}
