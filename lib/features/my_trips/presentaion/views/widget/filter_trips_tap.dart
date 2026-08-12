import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterTripsTap extends StatelessWidget {
  const FilterTripsTap({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
        padding: EdgeInsets.all(4.r),
        decoration: BoxDecoration(
          color: ColorsManager.border,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: TabBar(
          dividerColor: Colors.transparent,
          indicatorSize: TabBarIndicatorSize.tab,

          labelColor: ColorsManager.darkBackground,
          unselectedLabelColor: ColorsManager.textSecondary,

          indicator: BoxDecoration(
            color: ColorsManager.surfacePrimary,
            borderRadius: BorderRadius.circular(10.r),
          ),

          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          splashFactory: NoSplash.splashFactory,
          tabs: [
            Tab(text: "all".tr()),
            Tab(text: "complete".tr()),
            Tab(text: "canceeled".tr()),
          ],
        ),
      ),
    );
  }
}
