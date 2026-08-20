import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsFilterTaps extends StatelessWidget {
  const NotificationsFilterTaps({super.key});

  @override
  Widget build(BuildContext context) {
    final taps = ['all', 'unread', 'trips', 'offers'];
    return DefaultTabController(
      length: taps.length,
      child: Builder(
        builder: (context) {
          final tabController = DefaultTabController.of(context);

          return SizedBox(
            height: 40.h,
            child: AnimatedBuilder(
              animation: tabController.animation!,
              builder: (context, _) {
                final selectedIndex = tabController.index;

                return TabBar(
                  controller: tabController,
                  isScrollable: true,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                    color: ColorsManager.darkBackground,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: ColorsManager.brandPrimary,
                  unselectedLabelColor: ColorsManager.textSecondary,
                  labelStyle: TextStyles.textStyleBold12,
                  unselectedLabelStyle: TextStyles.textStyleBold12,
                  overlayColor: const WidgetStatePropertyAll(
                    Colors.transparent,
                  ),
                  tabAlignment: TabAlignment.start,
                  padding: EdgeInsets.zero,
                  labelPadding: EdgeInsets.symmetric(horizontal: 4.w),
                  tabs: List.generate(taps.length, (index) {
                    return NotificationItemTap(
                      title: taps[index],
                      isSelected: selectedIndex == index,
                    );
                  }),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class NotificationItemTap extends StatelessWidget {
  const NotificationItemTap({
    super.key,
    required this.title,
    required this.isSelected,
  });

  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.transparent
              : ColorsManager.surfaceSecondary,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Text(
          title.tr(),
          style: TextStyles.textStyleBold12.copyWith(
            color: isSelected
                ? ColorsManager.brandPrimary
                : ColorsManager.textSecondary,
          ),
        ),
      ),
    );
  }
}
