import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_switch_tile.dart';
import 'package:barq_go/core/widgets/box_shape_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrustedContactCardList extends StatelessWidget {
  const TrustedContactCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 2,
        separatorBuilder: (_, __) => 12.verticalSpace,
        itemBuilder: (context, index) {
          return const TrustedContactCard();
        },
      ),
    );
  }
}

class TrustedContactCard extends StatefulWidget {
  const TrustedContactCard({super.key});

  @override
  State<TrustedContactCard> createState() => _TrustedContactCardState();
}

class _TrustedContactCardState extends State<TrustedContactCard> {
  bool isAutoShareEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: ColorsManager.surfacePrimary,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 62.w,
                height: 62.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ColorsManager.surfaceSecondary,
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: Image.asset(
                  Assets.assetsImagesPngProfileLogo,
                  width: 30.w,
                  height: 30.w,
                ),
              ),

              12.horizontalSpace,

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "trusted_contact_name".tr(),
                      style: TextStyles.textStyleSemiBold14,
                    ),

                    4.verticalSpace,

                    Text(
                      '${"trusted_contact_phone".tr()} • ${"trusted_contact_relation".tr()}',
                      style: TextStyles.textStyleRegular12.copyWith(
                        color: ColorsManager.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),

              8.horizontalSpace,

              BoxShapeIcon(
                
                boxColor: ColorsManager.danger.withAlpha(9),
                assetPath: Assets.assetsImagesIconsDelete,
              ),
            ],
          ),

          16.verticalSpace,

          Divider(
            height: 1.h,
            thickness: 1.h,
            color: ColorsManager.surfaceSecondary,
          ),

          8.verticalSpace,

          AppSwitchTile(
            title: "auto_share_trip".tr(),
            value: isAutoShareEnabled,
            onChanged: (value) {
              setState(() {
                isAutoShareEnabled = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
