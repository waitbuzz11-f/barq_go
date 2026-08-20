import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/box_shape_icon.dart';
import 'package:barq_go/features/notification/presentaion/views/widgets/notifications_filter_taps.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotficationsHeader extends StatelessWidget {
  const NotficationsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == 'ar';

    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 8.w),
      decoration: BoxDecoration(color: ColorsManager.surfacePrimary),
      child: Column(
        children: [
          Row(
            children: [
              Transform.scale(
                scaleX: isArabic ? 1 : -1,
                child: Padding(
                  padding: EdgeInsets.all(8.0.r),
                  child: BoxShapeIcon(
                    boxColor: ColorsManager.surfaceSecondary,
                    assetPath: Assets.assetsImagesIconsArrBackRight,
                    onTap: () => Navigator.pop(context),
                  ),
                ),
              ),
              Text(
                "notifications".tr(),
                style: TextStyles.textStyleExtraBold20,
              ),
              4.horizontalSpace,
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: ColorsManager.brandPrimary,
                  shape: BoxShape.circle,
                ),
                child: Text("4", style: TextStyles.textStyleExtraBold11),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
                decoration: BoxDecoration(
                  color: ColorsManager.brandPrimary.withAlpha(13),
                ),
                child: Text(
                  "mark_all_as_read".tr(),
                  style: TextStyles.textStyleSemiBold12,
                ),
              ),
            ],
          ),
          NotificationsFilterTaps(),
        ],
      ),
    );
  }
}
