import 'package:barq_go/core/widgets/app_svg_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoxShapeIcon extends StatelessWidget {
  const BoxShapeIcon({
    super.key,
    required this.boxColor,
    required this.assetPath,
    this.onTap,
    this.paddingValue = 10,
    this.assetColor,
  });

  final Color boxColor;
  final String assetPath;
  final VoidCallback? onTap;
  final double paddingValue;
  final Color? assetColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22.r),
      child: Container(
        padding: EdgeInsets.all(paddingValue.r),
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: AppSvgHandler(assetPath: assetPath, color: assetColor, ),
      ),
    );
  }
}
