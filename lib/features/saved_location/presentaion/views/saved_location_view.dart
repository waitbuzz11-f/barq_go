import 'package:barq_go/core/helper/extensions.dart';
import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/routing/routes.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_button_widget.dart';
import 'package:barq_go/core/widgets/app_svg_handler.dart';
import 'package:barq_go/core/widgets/custom_app_bar.dart';
import 'package:barq_go/features/saved_location/presentaion/views/widgets/saved_locations_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SavedLocationView extends StatelessWidget {
  const SavedLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "saved_locations"),
      body: Column(
        children: [
          SavedLocationsList(),
          16.verticalSpace,
          Padding(
            padding: EdgeInsets.all(16.r),
            child: AppButtonWidget(
              text: "add_new_location",
              borderColor: ColorsManager.darkLight.withAlpha(12),
              textColor: ColorsManager.brandPrimary,
              backgroundColor: ColorsManager.surfaceSecondary,
              icon: AppSvgHandler(assetPath: Assets.assetsImagesIconsAdd),
              onTap: () {
                context.pushNamed(Routes.addLocation);
              },
            ),
          ),
        ],
      ),
    );
  }
}
