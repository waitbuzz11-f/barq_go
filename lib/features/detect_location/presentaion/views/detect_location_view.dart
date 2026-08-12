import 'package:barq_go/features/detect_location/presentaion/views/widgets/detect_location_header.dart';
import 'package:barq_go/features/detect_location/presentaion/views/widgets/detect_location_widget.dart';
import 'package:barq_go/features/home/presentaion/views/widgets/map_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetectLocationView extends StatelessWidget {
  const DetectLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(child: MapWidget()),
          Positioned(
            top: 40.h,
            left: 16.w,
            right: 16.w,
            child: const DetectLocationHeader(),
          ),
          Positioned(child: DetectLocationWidget()),
        ],
      ),
    );
  }
}
