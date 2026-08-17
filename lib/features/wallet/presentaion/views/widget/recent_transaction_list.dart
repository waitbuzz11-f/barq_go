import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/box_shape_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentTransactionList extends StatelessWidget {
  const RecentTransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return RecentTransactionItem(
            imgPath: Assets.assetsImagesIconsAddBalance,
            title: "wallet_recharge",
            subTitle: "yesterday_at_2_15_pm",
            value: 'transaction_amount',
          );
        },
        separatorBuilder: (context, index) {
          return 8.verticalSpace;
        },
        itemCount: 8,
      ),
    );
  }
}

class RecentTransactionItem extends StatelessWidget {
  const RecentTransactionItem({
    super.key,
    required this.imgPath,
    required this.title,
    required this.subTitle,
    required this.value,
  });
  final String imgPath, title, subTitle, value;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.surfacePrimary,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: ListTile(
        leading: BoxShapeIcon(
          boxColor: ColorsManager.lightSuccess,
          assetPath: imgPath,
        ),
        title: Text(title.tr(), style: TextStyles.textStyleSemiBold13),
        subtitle: Text(
          subTitle.tr(),
          style: TextStyles.textStyleSemiBold11.copyWith(
            color: ColorsManager.textSecondary,
          ),
        ),
        trailing: Text(value.tr(), style: TextStyles.textStyleSemiBold14),
      ),
    );
  }
}
