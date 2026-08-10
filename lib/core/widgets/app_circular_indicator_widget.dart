import '../themes/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCircularIndicatorWidget extends StatelessWidget {
  final double height;
  final double width;

  const AppCircularIndicatorWidget({
    super.key,
    this.height = 35,
    this.width = 35,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      width: width.w,
      child: const CircularProgressIndicator(
        strokeWidth: 3,
        color: ColorsManager.brandPrimary,
      ),
    );
  }
}
