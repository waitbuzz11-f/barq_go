import 'package:barq_go/core/helper/extensions.dart';
import 'package:barq_go/core/routing/routes.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_button_widget.dart';
import 'package:barq_go/core/widgets/app_text_field.dart';
import 'package:barq_go/core/widgets/custom_app_bar.dart';
import 'package:barq_go/features/add_balance/presentaion/view/widgets/add_balance_amount_selector.dart';
import 'package:barq_go/features/add_balance/presentaion/view/widgets/add_balance_payment_methods_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddBalanceView extends StatefulWidget {
  const AddBalanceView({super.key});

  @override
  State<AddBalanceView> createState() => _AddBalanceViewState();
}

class _AddBalanceViewState extends State<AddBalanceView> {
  final TextEditingController amountController = TextEditingController();

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "wallet_recharge"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    "current_balance".tr(),
                    style: TextStyles.textStyleRegular13.copyWith(
                      color: ColorsManager.textSecondary,
                    ),
                  ),
                  4.verticalSpace,
                  Text(
                    "8.750 ${"kwd".tr()}",
                    style: TextStyles.textStyleBold32.copyWith(
                      color: ColorsManager.brandPrimary,
                    ),
                  ),
                ],
              ),
            ),

            24.verticalSpace,

            Text(
              "balance".tr(),
              style: TextStyles.textStyleRegular13.copyWith(
                color: ColorsManager.textSecondary,
              ),
            ),

            12.verticalSpace,

            AddBalanceAmountSelector(controller: amountController),

            12.verticalSpace,

            AppTextFormField(
              controller: amountController,
              hintText: "add_custom_balance".tr(),
            ),

            24.verticalSpace,

            Text(
              "payment_methods".tr(),
              style: TextStyles.textStyleRegular13.copyWith(
                color: ColorsManager.textSecondary,
              ),
            ),

            8.verticalSpace,

            const AddBalancePaymentMethodsList(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.r),
        child: AppButtonWidget(
          text: 'wallet_recharge',
          textColor: ColorsManager.surfacePrimary,
          onTap: () {
            context.pushNamed(Routes.addBalanceStatus);
          },
        ),
      ),
    );
  }
}
