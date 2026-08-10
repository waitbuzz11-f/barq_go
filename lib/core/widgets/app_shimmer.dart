import '../themes/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer extends StatelessWidget {
  final double width;
  final double height;
  final BoxShape shape;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? margin;

  const AppShimmer({
    super.key,
    this.width = double.infinity,
    this.height = 100,
    this.shape = BoxShape.rectangle,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      margin: margin,
      child: Shimmer.fromColors(
        baseColor: ColorsManager.surfaceSecondary,
        highlightColor: ColorsManager.surfacePrimary,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: ColorsManager.surfaceSecondary,
            shape: shape,
            borderRadius: shape == BoxShape.circle ? null : borderRadius,
          ),
        ),
      ),
    );
  }
}
