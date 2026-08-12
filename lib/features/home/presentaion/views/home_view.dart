import 'package:barq_go/features/home/presentaion/views/widgets/map_footer.dart';
import 'package:barq_go/features/home/presentaion/views/widgets/map_header.dart';
import 'package:barq_go/features/home/presentaion/views/widgets/map_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MapWidget(),
        Positioned(top: 55.h, left: 15.w, right: 15.w, child: MapHeader()),
        MapFooter(),
      ],
    );
  }
}
