import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TripTrackingSheet extends StatelessWidget {
  const TripTrackingSheet({
    super.key,
    required this.content,
    required this.extent,
  });

  final Widget content;
  final double extent;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: extent,
      minChildSize: 0.25,
      maxChildSize: 0.90,
      snap: true,
      builder: (context, scrollController) {
        return Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.r),
              topRight: Radius.circular(24.r),
            ),
            color: ColorsManager.surfacePrimary,
          ),
          child: CustomScrollView(
            controller: scrollController,
            slivers: [SliverToBoxAdapter(child: content)],
          ),
        );
      },
    );
  }
}
