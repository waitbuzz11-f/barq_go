import 'package:barq_go/core/helper/extensions.dart';
import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/routing/routes.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_svg_handler.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionType extends StatelessWidget {
  TransactionType({super.key});
  final List<String> type = ["recharge", "payment_history", "transfer"];
  final List<String> imgPath = [
    Assets.assetsImagesIconsAdd,
    Assets.assetsImagesIconsHistory,
    Assets.assetsImagesIconsTransaction,
  ];
  final List<String> routesNavigte = [
    Routes.addBalance,
    Routes.addBalance,
    Routes.addBalance,
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      decoration: BoxDecoration(
        color: ColorsManager.darkBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.r),
          bottomRight: Radius.circular(24.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(type.length, (index) {
          return Expanded(
            child: InkWell(
              onTap: () {
                context.pushNamed(routesNavigte[index]);
              },
              child: TransactionTypeElement(
                imgPath: imgPath[index],
                type: type[index],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class TransactionTypeElement extends StatelessWidget {
  const TransactionTypeElement({
    super.key,
    required this.imgPath,
    required this.type,
  });
  final String imgPath, type;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSvgHandler(assetPath: imgPath),
        5.verticalSpace,
        Text(
          type.tr(),
          style: TextStyles.textStyleMedium11.copyWith(
            color: ColorsManager.surfacePrimary.withAlpha(70),
          ),
        ),
      ],
    );
  }
}
