import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/phone_field_with_country_picker.dart';
import 'package:barq_go/features/auth/presentaion/cubit/auth_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhoneFieldWidget extends StatelessWidget {
  const PhoneFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: ColorsManager.darkSurface,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
        ),
        child: Column(
          children: [
            Text(
              "phone_number".tr(),
              style: TextStyles.textStyleBold11.copyWith(
                color: ColorsManager.darkLight.withAlpha(40),
              ),
            ),
            16.verticalSpace,
            AppPhoneFieldWithCountryPicker(
              phoneController: context.read<AuthCubit>().phoneController,
              countryCodeController: context
                  .read<AuthCubit>()
                  .countryCodeController,
              hintText: "XXXXXXXX",
            ),
          ],
        ),
      ),
    );
  }
}
