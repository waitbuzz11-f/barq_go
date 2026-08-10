import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSvgHandler extends StatelessWidget {
  const AppSvgHandler({
    super.key,
    required this.assetPath,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
    this.color,
    this.alignment = Alignment.center,
    this.semanticsLabel,
  });

  final String assetPath;
  final double? height;
  final double? width;
  final BoxFit fit;
  final Color? color;
  final AlignmentGeometry alignment;
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetPath,
      height: height,
      width: width,
      fit: fit,
      alignment: alignment,
      semanticsLabel: semanticsLabel,
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
    );
  }
}
