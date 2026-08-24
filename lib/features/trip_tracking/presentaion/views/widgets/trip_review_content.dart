import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_button_widget.dart';
import 'package:barq_go/core/widgets/app_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TripReviewContent extends StatelessWidget {
  const TripReviewContent({super.key});

  @override
  Widget build(BuildContext context) {
    final reviewTags = [
      "professional_driver",
      "excellent_driving",
      "clean_car",
      "on_time",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "how_was_your_trip_with_driver".tr(),
          style: TextStyles.textStyleBold17,
        ),

        12.verticalSpace,

        Center(
          child: RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.w),
            itemBuilder: (context, _) =>
                const Icon(Icons.star, color: ColorsManager.brandPrimary),
            onRatingUpdate: (rating) {},
          ),
        ),

        16.verticalSpace,

        Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: reviewTags.map((tag) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: ColorsManager.brandPrimary.withAlpha(9),
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: ColorsManager.brandPrimary),
              ),
              child: Text(
                tag.tr(),
                style: TextStyles.textStyleSemiBold13.copyWith(
                  color: ColorsManager.brandPrimary,
                ),
              ),
            );
          }).toList(),
        ),

        16.verticalSpace,

        AppTextFormField(hintText: "add_comment_optional".tr()),

        8.verticalSpace,

        AppButtonWidget(
          text: "submit_rating",
          textColor: ColorsManager.surfacePrimary,
        ),
      ],
    );
  }
}
