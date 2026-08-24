import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_svg_handler.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodList extends StatefulWidget {
  const PaymentMethodList({super.key});

  @override
  State<PaymentMethodList> createState() => _PaymentMethodListState();
}

class _PaymentMethodListState extends State<PaymentMethodList> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        separatorBuilder: (context, index) => 8.horizontalSpace,
        itemBuilder: (context, index) {
          final isSelected = currentIndex == index;

          return InkWell(
            onTap: () {
              setState(() {
                currentIndex = index;
              });
            },
            borderRadius: BorderRadius.circular(16.r),
            child: PaymentMethod(
              isSelected: isSelected,
              paymentType: "add_payment_method".tr(),
            ),
          );
        },
      ),
    );
  }
}

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({
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
          color: isSelected ? ColorsManager.brandPrimary : ColorsManager.border,
          width: 1.5.w,
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
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
