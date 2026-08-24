import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_button_widget.dart';
import 'package:barq_go/core/widgets/app_svg_handler.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TripDataList extends StatelessWidget {
  const TripDataList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: 2,
        separatorBuilder: (_, __) => 8.verticalSpace,
        itemBuilder: (context, index) {
          return TripDataCard(
            subTitle: "package".tr(),
            title: "16 يوليو",
            value: '1.800 ${"kwd".tr()}',
          );
        },
      ),
    );
  }
}

class TripDataCard extends StatefulWidget {
  const TripDataCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.value,
  });

  final String title;
  final String subTitle;
  final String value;

  @override
  State<TripDataCard> createState() => _TripDataCardState();
}

class _TripDataCardState extends State<TripDataCard> {
  bool isRowShow = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: ColorsManager.surfacePrimary,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 40.w,
                height: 40.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorsManager.success.withAlpha(40),
                ),
                child: Image.asset(
                  Assets.assetsImagesPngPackge,
                  width: 22.w,
                  height: 22.h,
                  color: ColorsManager.darkBackground,
                ),
              ),

              10.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title, style: TextStyles.textStyleBold13),
                    3.verticalSpace,
                    Text(
                      widget.subTitle,
                      style: TextStyles.textStyleRegular11.copyWith(
                        color: ColorsManager.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),

              Column(
                children: [
                  Text(widget.value, style: TextStyles.textStyleExtraBold14),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: ColorsManager.success.withAlpha(13),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      widget.subTitle,
                      style: TextStyles.textStyleRegular11.copyWith(
                        color: ColorsManager.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          12.verticalSpace,

          InkWell(
            onTap: () {
              isRowShow = !isRowShow;
              setState(() {});
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: ColorsManager.surfaceSecondary,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _LocationItem(
                    color: ColorsManager.categoryInterCity,
                    title: "شرق، برج الكويت",
                  ),

                  Padding(
                    padding: EdgeInsetsDirectional.only(start: 3.5.w),
                    child: Container(
                      width: 1.w,
                      height: 20.h,
                      color: ColorsManager.darkLight.withAlpha(30),
                    ),
                  ),

                  _LocationItem(
                    color: ColorsManager.danger,
                    title: "حولي، شارع تونس",
                  ),
                ],
              ),
            ),
          ),
          16.verticalSpace,
          if (isRowShow) Divider(color: ColorsManager.border),
          if (isRowShow)
            Row(
              children: [
                Expanded(
                  child: AppButtonWidget(
                    text: "details",
                    backgroundColor: ColorsManager.surfaceSecondary,
                  ),
                ),
                8.horizontalSpace,
                Expanded(child: AppButtonWidget(text: "rebook")),
              ],
            ),
        ],
      ),
    );
  }
}

class _LocationItem extends StatelessWidget {
  const _LocationItem({required this.color, required this.title});

  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppSvgHandler(
          width: 8.w,
          height: 8.h,
          assetPath: Assets.assetsImagesIconsCircle,
          color: color,
        ),

        8.horizontalSpace,

        Expanded(
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.textStyleBold12,
          ),
        ),
      ],
    );
  }
}
