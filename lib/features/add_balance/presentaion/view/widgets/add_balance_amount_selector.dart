import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddBalanceAmountSelector extends StatefulWidget {
  const AddBalanceAmountSelector({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<AddBalanceAmountSelector> createState() =>
      _AddBalanceAmountSelectorState();
}

class _AddBalanceAmountSelectorState extends State<AddBalanceAmountSelector> {
  final List<int> amounts = [
    50000,
    10000,
    2000,
    1000,
  ];

  int? selectedAmount;

  void selectAmount(int amount) {
    setState(() {
      selectedAmount = amount;
    });

    widget.controller.text = amount.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children: amounts.map((amount) {
        final isSelected = selectedAmount == amount;

        return InkWell(
          onTap: () => selectAmount(amount),
          borderRadius: BorderRadius.circular(12.r),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 12.h,
            ),
            decoration: BoxDecoration(
              color: isSelected
                  ? ColorsManager.brandPrimary.withAlpha(8)
                  : ColorsManager.surfacePrimary,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: isSelected
                    ? ColorsManager.brandPrimary
                    : ColorsManager.darkLight.withAlpha(10),
              ),
            ),
            child: Text(
              amount.toString(),
              style: TextStyles.textStyleSemiBold14.copyWith(
                color: isSelected
                    ? ColorsManager.brandPrimary
                    : ColorsManager.textPrimary,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}