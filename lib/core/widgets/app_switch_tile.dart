import '../themes/app_text_styles.dart';
import '../themes/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSwitchTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const AppSwitchTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
      title: Text(title, style: TextStyles.textStyleRegular13),
      subtitle: subtitle == null
          ? null
          : Text(subtitle!, style: TextStyles.textStyleRegular11),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return ColorsManager.darkSurface;
          }
          return ColorsManager.darkInput;
        }),

        activeTrackColor: ColorsManager.brandPrimary,
        inactiveTrackColor: ColorsManager.surfaceSecondary,
      ),
    );
  }
}
