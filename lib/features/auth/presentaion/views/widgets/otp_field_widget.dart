import 'dart:async';

import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_button_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class OtpFieldWidget extends StatefulWidget {
  const OtpFieldWidget({super.key});

  @override
  State<OtpFieldWidget> createState() => _OtpFieldWidgetState();
}

class _OtpFieldWidgetState extends State<OtpFieldWidget> {
  Timer? _timer;

  int _seconds = 60;

  bool get isTimeOut => _seconds == 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();

    setState(() {
      _seconds = 60;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void _resendCode() {
    // TODO: call resend OTP API

    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 68.w,
      height: 76.h,
      textStyle: TextStyles.textStyleExtraBold30.copyWith(
        color: ColorsManager.brandPrimary,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: ColorsManager.textSecondary, width: 1.5.w),
        borderRadius: BorderRadius.circular(20.r),
      ),
    );

    final activePinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: ColorsManager.brandPrimary.withAlpha(20),
        border: Border.all(color: ColorsManager.brandPrimary, width: 1.5.w),
        borderRadius: BorderRadius.circular(20.r),
      ),
    );

    return Expanded(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: ColorsManager.darkSurface,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28.r),
            topRight: Radius.circular(28.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Pinput(
              length: 4,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: activePinTheme,
              submittedPinTheme: activePinTheme,
              separatorBuilder: (index) => 14.horizontalSpace,
            ),

            24.verticalSpace,

            if (isTimeOut)
              AppButtonWidget(
                text: 'resend_code'.tr(),
                width: 138.w,
                backgroundColor: ColorsManager.brandPrimary.withAlpha(10),
                textColor: ColorsManager.brandPrimary,
                borderColor: ColorsManager.brandPrimary.withAlpha(40),
                onTap: _resendCode,
              )
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'resend_in'.tr(),
                    style: TextStyles.textStyleRegular13.copyWith(
                      color: ColorsManager.surfacePrimary.withAlpha(40),
                    ),
                  ),

                  16.horizontalSpace,

                  Container(
                    width: 48.w,
                    height: 48.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorsManager.brandPrimary,
                        width: 4.w,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      _seconds.toString().padLeft(2, '0'),
                      style: TextStyles.textStyleBold13.copyWith(
                        color: ColorsManager.surfacePrimary,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
