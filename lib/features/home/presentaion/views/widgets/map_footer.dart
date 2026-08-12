import 'package:barq_go/core/helper/extensions.dart';
import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/routing/routes.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_svg_handler.dart';
import 'package:barq_go/core/widgets/app_text_field.dart';
import 'package:barq_go/features/home/presentaion/views/widgets/choose_delyer_type_list.dart';
import 'package:barq_go/features/home/presentaion/views/widgets/recent_destinations_list.dart';
import 'package:barq_go/features/home/presentaion/views/widgets/recent_location_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MapFooter extends StatelessWidget {
  const MapFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.15,
      minChildSize: 0.15,
      maxChildSize: 0.7,
      builder: (context, scrollController) {
        return Container(
          padding: EdgeInsets.fromLTRB(16.w, 10.h, 16.w, 16.h),
          decoration: BoxDecoration(
            color: ColorsManager.surfacePrimary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.r),
              topRight: Radius.circular(24.r),
            ),
          ),
          child: ListView(
            controller: scrollController,
            padding: EdgeInsets.zero,
            children: [
              Center(
                child: Container(
                  width: 40.w,
                  height: 4.h,
                  margin: EdgeInsets.only(bottom: 16.h),
                  decoration: BoxDecoration(
                    color: ColorsManager.textSecondary.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
              ),
              AppTextFormField(
                hintText: 'where_do_you_want_to_go'.tr(),
                onTap: () {
                  context.pushNamed(Routes.detectLocation);
                },
                fillColor: ColorsManager.surfaceSecondary,
                suffixIcon: AppSvgHandler(
                  assetPath: Assets.assetsImagesIconsSearch,
                ),
              ),

              12.verticalSpace,
              Row(
                children: [
                  AppSvgHandler(assetPath: Assets.assetsImagesIconsCircle),
                  8.horizontalSpace,
                  Text(
                    "start_from_your_current_location".tr(),
                    style: TextStyles.textStyleRegular13,
                  ),
                ],
              ),
              12.verticalSpace,
              ChooseDeliveryTypeList(),
              16.verticalSpace,
              RecentLocationList(),
              16.verticalSpace,
              Text(
                "recent_destinations".tr(),
                style: TextStyles.textStyleSemiBold12.copyWith(
                  color: ColorsManager.textSecondary,
                ),
              ),
              RecentDestinationsList(),
            ],
          ),
        );
      },
    );
  }
}
