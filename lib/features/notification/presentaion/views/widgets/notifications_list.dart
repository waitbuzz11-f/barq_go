import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/box_shape_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsList extends StatelessWidget {
  const NotificationsList({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      NotificationModel(
        isRead: false,
        imgPath: Assets.assetsImagesIconsTrips,
        title: 'notification_trip_title',
        subTitle: 'notification_trip_desc',
        value: '2_min_ago',
      ),
      NotificationModel(
        isRead: false,
        imgPath: Assets.assetsImagesIconsTrips,
        title: 'notification_offer_title',
        subTitle: 'notification_offer_desc',
        value: '10_min_ago',
      ),
      NotificationModel(
        isRead: true,
        imgPath: Assets.assetsImagesIconsTrips,
        title: 'notification_trip_completed_title',
        subTitle: 'notification_trip_completed_desc',
        value: '1_hour_ago',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'new'.tr(),
              style: TextStyles.textStyleBold11.copyWith(
                color: ColorsManager.textSecondary,
              ),
            ),

            8.horizontalSpace,

            Expanded(
              child: Divider(
                height: 1,
                thickness: 1,
                color: ColorsManager.darkBackground.withAlpha(7),
              ),
            ),
          ],
        ),

        12.verticalSpace,

        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: notifications.length,
          separatorBuilder: (_, __) => 8.verticalSpace,
          itemBuilder: (context, index) {
            final notification = notifications[index];

            return NotificationCard(
              isRead: notification.isRead,
              imgPath: notification.imgPath,
              title: notification.title,
              subTitle: notification.subTitle,
              value: notification.value,
            );
          },
        ),
      ],
    );
  }
}

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.isRead,
    required this.imgPath,
    required this.title,
    required this.subTitle,
    required this.value,
  });

  final bool isRead;
  final String imgPath;
  final String title;
  final String subTitle;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: isRead ? Colors.transparent : ColorsManager.surfacePrimary,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BoxShapeIcon(
            paddingValue: 11,
            boxColor: ColorsManager.lightSuccess,
            assetPath: imgPath,
          ),

          12.horizontalSpace,

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title.tr(), style: TextStyles.textStyleSemiBold13),

                4.verticalSpace,

                Text(
                  subTitle.tr(),
                  style: TextStyles.textStyleSemiBold11.copyWith(
                    color: ColorsManager.textSecondary,
                  ),
                ),
              ],
            ),
          ),

          8.horizontalSpace,

          Text(
            value.tr(),
            style: TextStyles.textStyleSemiBold11.copyWith(
              color: ColorsManager.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationModel {
  final bool isRead;
  final String imgPath;
  final String title;
  final String subTitle;
  final String value;

  const NotificationModel({
    required this.isRead,
    required this.imgPath,
    required this.title,
    required this.subTitle,
    required this.value,
  });
}
