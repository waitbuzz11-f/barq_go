import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_button_widget.dart';
import 'package:barq_go/core/widgets/app_svg_handler.dart';
import 'package:barq_go/core/widgets/custom_app_bar.dart';
import 'package:barq_go/features/trusted_contacts/presentaion/views/widgets/massege_share_link.dart';
import 'package:barq_go/features/trusted_contacts/presentaion/views/widgets/trusted_contact_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrustedContactsView extends StatelessWidget {
  const TrustedContactsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'trusted_contacts'),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          children: [
            MassegeShareLink(),
            16.verticalSpace,
            TrustedContactCardList(),
            16.verticalSpace,
            AppButtonWidget(
              text: "add_new_location",
              borderColor: ColorsManager.darkLight.withAlpha(12),
              textColor: ColorsManager.brandPrimary,
              backgroundColor: ColorsManager.surfaceSecondary,
              icon: AppSvgHandler(
                assetPath: Assets.assetsImagesIconsAddContact,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
