import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/box_shape_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == 'ar';

    return AppBar(
      leadingWidth: 60.w,
      leading: Transform.scale(
        scaleX: isArabic ? 1 : -1,
        child: Padding(
          padding: EdgeInsets.all(8.0.r),
          child: BoxShapeIcon(
            boxColor: ColorsManager.surfaceSecondary,
            assetPath: Assets.assetsImagesIconsArrBackRight,
            onTap: () => Navigator.pop(context),
          ),
        ),
      ),
      centerTitle: true,
      title: Text(title.tr(), style: TextStyles.textStyleBold17),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100.h);
}
