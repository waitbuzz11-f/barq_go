import 'dart:io';

import '../themes/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBottomSheetCardWidget extends StatelessWidget {
  final Widget? child;
  const AppBottomSheetCardWidget({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 16.h,
        left: 16.w,
        right: 16.w,
        bottom: Platform.isAndroid ? 30.h : 16.h,
      ),
      decoration: BoxDecoration(
        color: ColorsManager.surfacePrimary,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      child: child,
    );
  }
}
