import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_button_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceTimeContent extends StatefulWidget {
  const ServiceTimeContent({super.key});

  @override
  State<ServiceTimeContent> createState() => _ServiceTimeContentState();
}

class _ServiceTimeContentState extends State<ServiceTimeContent> {
  int selectedIndex = 0;

  final List<Map<String, String>> serviceTimes = [
    {"title": "now", "subTitle": "as_soon_as_possible"},
    {"title": "later", "subTitle": "schedule_specific_time"},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "when_do_you_want_service".tr(),
          style: TextStyles.textStyleBold15,
        ),

        16.verticalSpace,

        Row(
          children: List.generate(serviceTimes.length, (index) {
            final item = serviceTimes[index];

            return Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                  end: index == serviceTimes.length - 1 ? 0 : 12.w,
                ),
                child: ChooseTimeCard(
                  isSelected: selectedIndex == index,
                  title: item["title"]!.tr(),
                  subTitle: item["subTitle"]!.tr(),
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
              ),
            );
          }),
        ),
        12.verticalSpace,
        AppButtonWidget(
          text: "next_pickup_location",
          textColor: ColorsManager.surfacePrimary,
        ),
      ],
    );
  }
}

class ChooseTimeCard extends StatelessWidget {
  const ChooseTimeCard({
    super.key,
    required this.isSelected,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });

  final bool isSelected;
  final String title;
  final String subTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.r),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: isSelected
                ? ColorsManager.brandPrimary.withAlpha(9)
                : ColorsManager.surfaceSecondary,
            border: Border.all(
              color: isSelected
                  ? ColorsManager.brandPrimary
                  : ColorsManager.border,
            ),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(title, style: TextStyles.textStyleBold15),
              4.verticalSpace,
              Text(
                subTitle,
                style: TextStyles.textStyleSemiBold12.copyWith(
                  color: ColorsManager.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
