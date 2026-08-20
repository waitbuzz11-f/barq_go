import 'package:barq_go/core/helper/extensions.dart';
import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/routing/routes.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_button_widget.dart';
import 'package:barq_go/core/widgets/app_svg_handler.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TripCompletedContent extends StatelessWidget {
  const TripCompletedContent({super.key, this.makeReview});
  final Function()? makeReview;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppSvgHandler(assetPath: Assets.assetsImagesTripCompletedSuccess),
        12.verticalSpace,
        Text("trip_completed".tr(), style: TextStyles.textStyleBold18),
        8.verticalSpace,
        Text(
          "trip_price".tr(),
          style: TextStyles.textStyleBold24.copyWith(
            color: ColorsManager.brandPrimary,
          ),
        ),
        8.verticalSpace,
        Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: ColorsManager.surfaceSecondary,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "distance",
                style: TextStyles.textStyleRegular13.copyWith(
                  color: ColorsManager.textSecondary,
                ),
              ),
              Text("trip_distance", style: TextStyles.textStyleSemiBold13),
            ],
          ),
        ),
        8.verticalSpace,
        AppButtonWidget(
          text: "trip_rating",
          textColor: ColorsManager.surfacePrimary,
          onTap: makeReview,
        ),
        8.verticalSpace,
        AppButtonWidget(
          text: "home",
          textColor: ColorsManager.textSecondary,
          backgroundColor: ColorsManager.surfaceSecondary,
          borderColor: ColorsManager.border,
          onTap: () {
            context.pushNamed(Routes.home);
          },
        ),
      ],
    );
  }
}
