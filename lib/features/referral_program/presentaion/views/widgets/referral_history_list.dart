import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_svg_handler.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReferralHistoryList extends StatelessWidget {
  const ReferralHistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ReferralHistory> items = [
      ReferralHistory(
        title: "invite_your_friends".tr(),
        subTitle: "invite_your_friends_desc".tr(),
      ),
      ReferralHistory(
        title: "friend_completes_trip".tr(),
        subTitle: "friend_completes_trip_desc".tr(),
      ),
      ReferralHistory(
        title: "earn_your_credit".tr(),
        subTitle: "earn_your_credit_desc".tr(),
      ),
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: ColorsManager.surfacePrimary,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("referral_history".tr(), style: TextStyles.textStyleBold14),
            16.verticalSpace,
            ListView.separated(
              padding: EdgeInsets.zero,
              primary: false,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              separatorBuilder: (context, index) {
                return Divider(color: ColorsManager.surfaceSecondary);
              },
              itemBuilder: (context, index) {
                return ReferralHistoryCard(
                  imgPath: Assets.assetsImagesIconsProfile,
                  title: items[index].title,
                  subTitle: items[index].subTitle,
                  value: "transaction_amount",
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ReferralHistoryCard extends StatelessWidget {
  const ReferralHistoryCard({
    super.key,
    required this.imgPath,
    required this.title,
    required this.subTitle,
    required this.value,
  });

  final String imgPath;
  final String title;
  final String subTitle;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40.w,
          height: 40.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorsManager.lightSuccess.withAlpha(9),
          ),
          child: AppSvgHandler(
            assetPath: imgPath,
            color: ColorsManager.success,
          ),
        ),
        12.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title.tr(), style: TextStyles.textStyleBold13),

              2.verticalSpace,

              Text(
                subTitle.tr(),
                style: TextStyles.textStyleRegular12.copyWith(
                  color: ColorsManager.textSecondary,
                ),
              ),
            ],
          ),
        ),
        Text(
          value.tr(),
          style: TextStyles.textStyleExtraBold14.copyWith(
            color: ColorsManager.success,
          ),
        ),
      ],
    );
  }
}

class ReferralHistory {
  final String title;
  final String subTitle;

  const ReferralHistory({required this.title, required this.subTitle});
}
