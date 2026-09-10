import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/custtom_warning_sheet.dart';
import 'package:barq_go/features/help_center/data/models/help_center_data.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpCenterList extends StatelessWidget {
  const HelpCenterList({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      HelpCenterData(
        titleKey: 'request_emergency_help',
        subTitleKey: 'contact_authorities',
        assetPath: Assets.assetsImagesPngRequestEmergencyHelp,
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return const CustomWarningSheet(
                title: 'security_emergency',
                subTitle: 'activate_emergency_assistance_confirmation',
                confuirmButtonTitle: 'yes_request_help',
              );
            },
          );
        },
      ),
      HelpCenterData(
        titleKey: 'share_trip',
        subTitleKey: 'send_tracking_link_to_trusted_person',
        assetPath: Assets.assetsImagesPngShareTrip,
      ),
      HelpCenterData(
        titleKey: 'trusted_contacts',
        subTitleKey: 'auto_share_with_trusted_contacts',
        assetPath: Assets.assetsImagesPngTrustedContacts,
      ),
      HelpCenterData(
        titleKey: 'trip_code',
        subTitleKey: 'start_code',
        assetPath: Assets.assetsImagesPngTripCode,
      ),
      HelpCenterData(
        titleKey: 'verify_driver_identity',
        subTitleKey: 'verify_driver_details_match',
        assetPath: Assets.assetsImagesPngVerifyDriverIdentity,
      ),
      HelpCenterData(
        titleKey: 'report_safety_issue',
        subTitleKey: 'incorrect_driver_or_vehicle_details',
        assetPath: Assets.assetsImagesPngReportSafetyIssue,
      ),
      HelpCenterData(
        titleKey: 'safety_tips',
        subTitleKey: 'safe_trip_guidelines',
        assetPath: Assets.assetsImagesPngSafetyTips,
      ),
    ];

    return Expanded(
      child: ListView.separated(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return HelpCenterItem(
            title: item.titleKey.tr(),
            subTitle: item.subTitleKey.tr(),
            assetPath: item.assetPath,
            onTap: item.onTap,
          );
        },
        separatorBuilder: (_, _) => 12.verticalSpace,
      ),
    );
  }
}

class HelpCenterItem extends StatelessWidget {
  const HelpCenterItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.assetPath,
    this.onTap,
  });

  final String title;
  final String subTitle;
  final String assetPath;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        decoration: BoxDecoration(
          color: ColorsManager.surfacePrimary,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
          leading: Icon(
            Icons.arrow_back_ios_new,
            size: 18.sp,
            color: ColorsManager.textSecondary,
          ),
          title: Text(title, style: TextStyles.textStyleSemiBold14),
          subtitle: Text(subTitle, style: TextStyles.textStyleSemiBold12),
          trailing: Image.asset(assetPath),
        ),
      ),
    );
  }
}
