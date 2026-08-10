import 'package:barq_go/core/helper/extensions.dart';
import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/routing/routes.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_button_widget.dart';
import 'package:barq_go/core/widgets/app_svg_handler.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationPolicy extends StatelessWidget {
  const LocationPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            170.verticalSpace,
            AppSvgHandler(assetPath: Assets.assetsImagesLocation),
            Text("location_required".tr(), style: TextStyles.textStyleBold24),
            10.verticalSpace,
            Text(
              "location_required_description".tr(),
              style: TextStyles.textStyleRegular14.copyWith(
                color: ColorsManager.textSecondary,
              ),
            ),
            Spacer(),
            AppButtonWidget(
              text: "use_current_location".tr(),
              textColor: ColorsManager.surfacePrimary,
              onTap: () {
                context.pushNamed(Routes.mainLayout);
              },
              icon: AppSvgHandler(assetPath: Assets.assetsImagesIconsA),
            ),
            12.verticalSpace,
            AppButtonWidget(
              text: "choose_location_manually".tr(),
              backgroundColor: ColorsManager.surfaceSecondary,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "location_service_not_working".tr(),
                style: TextStyles.textStyleSemiBold14.copyWith(
                  color: ColorsManager.textSecondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
