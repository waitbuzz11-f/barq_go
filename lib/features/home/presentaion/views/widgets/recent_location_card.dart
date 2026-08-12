import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_svg_handler.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentLocationCard extends StatelessWidget {
  const RecentLocationCard({
    super.key,
    required this.imgPath,
    required this.title,
    required this.subTitle,
    this.time,
  });

  final String imgPath;
  final String title;
  final String subTitle;
  final String? time;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 174.w,
      height: 70.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: ColorsManager.darkLight.withAlpha(6)),
        color: ColorsManager.surfaceSecondary,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
        minVerticalPadding: 0,
        dense: true,
        visualDensity: VisualDensity.compact,
        titleAlignment: ListTileTitleAlignment.center,
        leading: Container(
          width: 40.w,
          height: 40.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorsManager.surfacePrimary,
          ),
          child: Image.asset(imgPath, width: 16.w, height: 24.h),
        ),
        title: Text(
          title.tr(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyles.textStyleSemiBold13,
        ),
        subtitle: Text(
          subTitle.tr(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyles.textStyleSemiBold11,
        ),
        trailing: time != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppSvgHandler(assetPath: Assets.assetsImagesIconsTime),
                  2.horizontalSpace,
                  Text(time!, style: TextStyles.textStyleSemiBold11),
                ],
              )
            : null,
      ),
    );
  }
}