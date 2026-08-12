import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/features/home/presentaion/views/widgets/recent_location_card.dart';
import 'package:flutter/material.dart';

class RecentDestinationsList extends StatelessWidget {
  const RecentDestinationsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return RecentLocationCard(
            imgPath: Assets.assetsImagesPngHome,
            title: "home",
            subTitle: "hawally_street_17",
            time: "5:00 m",
          );
        },
        separatorBuilder: (context, index) {
          return Divider(color: ColorsManager.darkLight.withAlpha(8));
        },
        itemCount: 2,
      ),
    );
  }
}
