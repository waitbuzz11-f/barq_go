import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileStaticsList extends StatelessWidget {
  ProfileStaticsList({super.key});

  final List<String> values = ["4.8", "12.5", "47"];
  final List<String> titles = ["star", "kwd_saved", "trip"];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(values.length * 2 - 1, (index) {
        if (index.isOdd) {
          return 8.horizontalSpace;
        }

        final itemIndex = index ~/ 2;

        return ProfileStaticsCard(
          title: titles[itemIndex],
          value: values[itemIndex],
        );
      }),
    );
  }
}

class ProfileStaticsCard extends StatelessWidget {
  const ProfileStaticsCard({
    super.key,
    required this.value,
    required this.title,
  });

  final String value, title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: ColorsManager.surfacePrimary,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyles.textStyleBold20.copyWith(
                color: ColorsManager.brandPrimary,
              ),
            ),
            8.verticalSpace,
            Text(title.tr(), style: TextStyles.textStyleRegular11),
          ],
        ),
      ),
    );
  }
}
