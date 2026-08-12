import 'package:barq_go/core/widgets/app_svg_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoxShapeIcon extends StatelessWidget {
  const BoxShapeIcon({
    super.key,
    required this.boxColor,
    required this.assetPath,
    this.onTap,
  });
  final Color boxColor;
  final String assetPath;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 36.w,
        height: 36.h,
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: AppSvgHandler(assetPath: assetPath),
      ),
    );
  }
}
