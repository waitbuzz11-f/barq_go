import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HowAppWorkList extends StatelessWidget {
  const HowAppWorkList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<HowAppWorkModel> items = [
      HowAppWorkModel(
        title: "invite_your_friends".tr(),
        subTitle: "invite_your_friends_desc".tr(),
      ),
      HowAppWorkModel(
        title: "friend_completes_trip".tr(),
        subTitle: "friend_completes_trip_desc".tr(),
      ),
      HowAppWorkModel(
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
            Text("how_it_works".tr(), style: TextStyles.textStyleBold14),

            16.verticalSpace,

            ListView.separated(
              padding: EdgeInsets.zero,
              primary: false,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              separatorBuilder: (context, index) {
                return 16.verticalSpace;
              },
              itemBuilder: (context, index) {
                return HowAppWorkCard(
                  indexList: index + 1,
                  title: items[index].title,
                  subTitle: items[index].subTitle,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HowAppWorkCard extends StatelessWidget {
  const HowAppWorkCard({
    super.key,
    required this.indexList,
    required this.title,
    required this.subTitle,
  });

  final int indexList;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32.w,
          height: 32.w,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: ColorsManager.brandPrimary,
          ),
          child: Text("$indexList", style: TextStyles.textStyleExtraBold13),
        ),

        12.horizontalSpace,

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyles.textStyleBold13),

              2.verticalSpace,

              Text(
                subTitle,
                style: TextStyles.textStyleRegular12.copyWith(
                  color: ColorsManager.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class HowAppWorkModel {
  final String title;
  final String subTitle;

  const HowAppWorkModel({required this.title, required this.subTitle});
}
