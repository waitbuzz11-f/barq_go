import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddBalancePaymentMethodsList extends StatefulWidget {
  const AddBalancePaymentMethodsList({super.key});

  @override
  State<AddBalancePaymentMethodsList> createState() =>
      _AddBalancePaymentMethodsListState();
}

class _AddBalancePaymentMethodsListState
    extends State<AddBalancePaymentMethodsList> {
  int selectedPaymentMethod = 0;

  final List<String> paymentMethods = ['KNET', 'Visa / Mastercard'];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: paymentMethods.length,
      separatorBuilder: (context, index) => 12.verticalSpace,
      itemBuilder: (context, index) {
        return AddBalancePaymentMethod(
          paymentMethod: paymentMethods[index],
          value: index,
          groupValue: selectedPaymentMethod,
          onChanged: (value) {
            if (value == null) return;

            setState(() {
              selectedPaymentMethod = value;
            });
          },
        );
      },
    );
  }
}

class AddBalancePaymentMethod extends StatelessWidget {
  const AddBalancePaymentMethod({
    super.key,
    required this.paymentMethod,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  final String paymentMethod;
  final int value;
  final int groupValue;
  final ValueChanged<int?> onChanged;

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;

    return InkWell(
      onTap: () => onChanged(value),
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
        width: double.infinity,
        decoration: BoxDecoration(
          color: isSelected
              ? ColorsManager.brandPrimary.withAlpha(8)
              : ColorsManager.surfacePrimary,
          border: Border.all(
            color: isSelected
                ? ColorsManager.brandPrimary
                : ColorsManager.darkLight.withAlpha(6),
            width: 1.5.w,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            Radio<int>(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
              activeColor: ColorsManager.brandPrimary,
            ),
            16.horizontalSpace,
            Text(paymentMethod, style: TextStyles.textStyleSemiBold14),
          ],
        ),
      ),
    );
  }
}
