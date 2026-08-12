import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/features/my_trips/presentaion/views/widget/filter_trips_tap.dart';
import 'package:barq_go/features/my_trips/presentaion/views/widget/trip_data_list.dart';
import 'package:barq_go/features/my_trips/presentaion/views/widget/trip_statics.dart';
import 'package:barq_go/features/my_trips/presentaion/views/widget/trips_category_taps.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTripsView extends StatelessWidget {
  const MyTripsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("my_trips".tr(), style: TextStyles.textStyleExtraBold24),
            12.verticalSpace,
            TripStatics(),
            16.verticalSpace,
            TripsCategoryTaps(),
            16.verticalSpace,
            FilterTripsTap(),
            16.verticalSpace,
            TripDataList(),
          ],
        ),
      ),
    );
  }
}
