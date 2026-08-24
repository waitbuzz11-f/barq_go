import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/features/wallet/presentaion/views/widget/payment_method_list.dart';
import 'package:barq_go/features/wallet/presentaion/views/widget/recent_transaction_list.dart';
import 'package:barq_go/features/wallet/presentaion/views/widget/transaction_type.dart';
import 'package:barq_go/features/wallet/presentaion/views/widget/wallet_card_data.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16.0.r),
        child: Column(
          children: [
            WalletCardData(),
            TransactionType(),
            16.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("payment_methods".tr(), style: TextStyles.textStyleBold14),
                Text(
                  "manage".tr(),
                  style: TextStyles.textStyleSemiBold12.copyWith(
                    color: ColorsManager.brandPrimary,
                  ),
                ),
              ],
            ),
            12.verticalSpace,
            PaymentMethodList(),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "recent_transactions".tr(),
                  style: TextStyles.textStyleBold14,
                ),
                Text(
                  "view_all".tr(),
                  style: TextStyles.textStyleSemiBold12.copyWith(
                    color: ColorsManager.brandPrimary,
                  ),
                ),
              ],
            ),
            12.verticalSpace,
            RecentTransactionList(),
          ],
        ),
      ),
    );
  }
}
