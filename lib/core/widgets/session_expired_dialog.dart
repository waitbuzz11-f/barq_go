import '../routing/app_navigator.dart';
import '../routing/routes.dart';
import '../themes/app_text_styles.dart';
import '../themes/colors_manager.dart';
import 'app_button_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SessionExpiredDialog extends StatelessWidget {
  const SessionExpiredDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorsManager.surfacePrimary,
      title: Text('session_expired'.tr(), style: TextStyles.textStyleBold16),
      content: Text(
        'please_login_again'.tr(),
        style: TextStyles.textStyleRegular14,
      ),
      actions: [
        SizedBox(
          width: double.infinity,
          child: AppButtonWidget(
            text: 'ok'.tr(),
            onTap: () {
              Navigator.of(context).pop();
              navigatorKey.currentState?.pushNamedAndRemoveUntil(
                Routes.login,
                (_) => false,
              );
            },
          ),
        ),
      ],
    );
  }
}
