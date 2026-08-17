import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_svg_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodList extends StatelessWidget {
const  PaymentMethodList({super.key});
  final currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var isSelected = currentIndex == index;
          return Paymentmethod(isSelected: isSelected, paymentType: "إضافة");
        },
        separatorBuilder: (context, index) {
          return 8.horizontalSpace;
        },
        itemCount: 7,
      ),
    );
  }
}

class Paymentmethod extends StatelessWidget {
  const Paymentmethod({
    super.key,
    required this.isSelected,
    required this.paymentType,
  });
  final bool isSelected;
  final String paymentType;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 9.h),
      decoration: BoxDecoration(
        color: isSelected
            ? ColorsManager.brandPrimary.withAlpha(13)
            : ColorsManager.surfacePrimary,
        border: Border.all(
          color: isSelected
              ? ColorsManager.brandPrimary
              : ColorsManager.surfacePrimary.withAlpha(6),
          width: 1.5.w,
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          AppSvgHandler(
            assetPath: Assets.assetsImagesIconsAdd,
            color: isSelected
                ? ColorsManager.darkLight
                : ColorsManager.textSecondary,
          ),
          8.horizontalSpace,
          Text(
            paymentType,
            style: TextStyles.textStyleSemiBold12.copyWith(
              color: isSelected
                  ? ColorsManager.darkLight
                  : ColorsManager.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
