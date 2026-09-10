import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/routing/routes.dart';
import 'package:barq_go/features/profile/presentaion/views/widgets/profile_option_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileOptionsList extends StatelessWidget {
  ProfileOptionsList({super.key});

  final List<String> profileMenuItems = [
    "personal_information",
    "saved_locations",
    "trusted_contacts",
    "payment_methods",
    "referral_program",
    "color_palette",
    "safety_center",
    "notifications",
    "settings",
    "help_support",
    "terms_privacy",
    "logout",
  ];

  final List<String> profileMenuSubtitles = [
    "personal_information_subtitle",
    "saved_locations_subtitle",
    "trusted_contacts_subtitle",
    "payment_methods_subtitle",
    "referral_program_subtitle",
    "color_palette_subtitle",
    "safety_center_subtitle",
    "notifications_subtitle",
    "settings_subtitle",
    "help_support_subtitle",
    "terms_privacy_subtitle",
    "",
  ];

  final List<String> profileMenuIcons = [
    Assets.assetsImagesIconsPersonalProfile,
    Assets.assetsImagesIconsProfileLocation,
    Assets.assetsImagesIconsAddContact,
    Assets.assetsImagesIconsPaymentMethod,
    Assets.assetsImagesIconsGift,
    Assets.assetsImagesIconsColorsPaleet,
    Assets.assetsImagesIconsPrivacy,
    Assets.assetsImagesIconsProfileNotification,
    Assets.assetsImagesIconsSettings,
    Assets.assetsImagesIconsHelpCenter,
    Assets.assetsImagesIconsPrivacyPolicy,
    Assets.assetsImagesIconsLogout,
  ];

  final List<String?> profileMenuRoutes = [
    Routes.editProfile,
    Routes.savedLocation,
    Routes.trustedContscts,
    Routes.addBalance,
    Routes.referralProgram,
    "/colorPalette",
    "/safetyCenter",
    Routes.notification,
    "/settings",
    Routes.helpCenter,
    "/termsPrivacy",
    null,
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: profileMenuItems.length,
        itemBuilder: (context, index) {
          return ProfileOptionsItem(
            assetPath: profileMenuIcons[index],
            title: profileMenuItems[index],
            subTitle: profileMenuSubtitles[index],
            onTap: () {
              final route = profileMenuRoutes[index];

              if (profileMenuItems[index] == "logout") {
                // TODO: logout logic
                return;
              }

              if (route != null) {
                Navigator.pushNamed(context, route);
              }
            },
          );
        },
        separatorBuilder: (context, index) {
          return 8.verticalSpace;
        },
      ),
    );
  }
}
