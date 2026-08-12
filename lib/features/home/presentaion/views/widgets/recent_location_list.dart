import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/features/home/presentaion/views/widgets/recent_location_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentLocationList extends StatelessWidget {
  const RecentLocationList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, index) {
          return RecentLocationCard(
            imgPath: Assets.assetsImagesPngHome,
            title: 'home',
            subTitle: 'hawally_street_17',
          );
        },
        separatorBuilder: (context, index) {
          return 10.horizontalSpace;
        },
      ),
    );
  }
}
