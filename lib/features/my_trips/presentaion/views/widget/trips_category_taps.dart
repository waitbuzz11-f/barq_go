import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TripsCategoryTaps extends StatefulWidget {
  const TripsCategoryTaps({super.key});

  @override
  State<TripsCategoryTaps> createState() => _TripsCategoryTapsState();
}

class _TripsCategoryTapsState extends State<TripsCategoryTaps> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: TabBar(
        isScrollable: true,
        dividerColor: Colors.transparent,
        indicatorColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        overlayColor: const WidgetStatePropertyAll(Colors.transparent),
        labelPadding: EdgeInsetsDirectional.only(end: 8.w),
        tabAlignment: TabAlignment.start,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        tabs: List.generate(5, (index) {
          return TipsCategoryTapItem(
            isSelected: currentIndex == index,
            imgPath: Assets.assetsImagesPngPackge,
            title: "tard",
          );
        }),
      ),
    );
  }
}

class TipsCategoryTapItem extends StatelessWidget {
  const TipsCategoryTapItem({
    super.key,
    required this.isSelected,
    required this.imgPath,
    required this.title,
  });

  final bool isSelected;
  final String imgPath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
      decoration: BoxDecoration(
        color: isSelected
            ? ColorsManager.darkBackground
            : ColorsManager.surfacePrimary,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imgPath,
            width: 14.w,
            height: 14.h,
            color: isSelected
                ? ColorsManager.brandPrimary
                : ColorsManager.textSecondary,
          ),
          6.horizontalSpace,
          Text(
            title,
            style: TextStyles.textStyleBold12.copyWith(
              color: isSelected
                  ? ColorsManager.brandPrimary
                  : ColorsManager.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
