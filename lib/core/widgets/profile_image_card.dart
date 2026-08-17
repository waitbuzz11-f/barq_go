import 'package:barq_go/core/helper/extensions.dart';
import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/routing/routes.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_svg_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImageCard extends StatelessWidget {
  const ProfileImageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        InkWell(
          onTap: () {
            context.pushNamed(Routes.editProfile);
          },
          child: Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: ColorsManager.surfaceSecondary,
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Image.asset(
              width: 40.w,
              height: 40.h,
              Assets.assetsImagesPngProfileLogo,
            ),
          ),
        ),
        Positioned(
          right: 0.w,
          bottom: -5.h,
          child: Container(
            padding: EdgeInsets.all(6.r),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorsManager.brandPrimary,
            ),
            child: AppSvgHandler(assetPath: Assets.assetsImagesIconsCamera),
          ),
        ),
      ],
    );
  }
}
