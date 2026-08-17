import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/profile_image_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileImageCard(),
        16.horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("driver_name".tr(), style: TextStyles.textStyleBold20),
            Text(
              "driver_phone".tr(),
              style: TextStyles.textStyleRegular13.copyWith(
                color: ColorsManager.textSecondary,
              ),
            ),
            Row(
              children: [
                Text(
                  "driver_rating_member_since".tr(),
                  style: TextStyles.textStyleRegular12.copyWith(
                    color: ColorsManager.textSecondary,
                  ),
                ),
                6.horizontalSpace,
                RatingBar.builder(
                  initialRating: 3,
                  itemSize: 15.sp,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 1.0.w),
                  itemBuilder: (context, _) =>
                      Icon(Icons.star, color: Colors.amber),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
