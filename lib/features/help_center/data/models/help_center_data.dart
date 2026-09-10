import 'dart:ui';

class HelpCenterData {
  const HelpCenterData({
    required this.titleKey,
    required this.subTitleKey,
    required this.assetPath,
    this.onTap,
  });

  final String titleKey;
  final String subTitleKey;
  final String assetPath;
  final VoidCallback? onTap;
}