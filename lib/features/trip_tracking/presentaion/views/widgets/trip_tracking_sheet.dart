import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TripTrackingSheet extends StatefulWidget {
  const TripTrackingSheet({
    super.key,
    required this.content,
    required this.contentKey,
    required this.extent,
  });

  final Widget content;
  final Key contentKey;
  final double extent;

  @override
  State<TripTrackingSheet> createState() => _TripTrackingSheetState();
}

class _TripTrackingSheetState extends State<TripTrackingSheet> {
  static const double _minExtent = 0.25;
  static const double _maxExtent = 0.60;

  final DraggableScrollableController _sheetController =
      DraggableScrollableController();

  double get _extent =>
      widget.extent.clamp(_minExtent, _maxExtent).toDouble();

  @override
  void didUpdateWidget(covariant TripTrackingSheet oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.extent != widget.extent && _sheetController.isAttached) {
      _sheetController.animateTo(
        _extent,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _sheetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      controller: _sheetController,
      initialChildSize: _extent,
      minChildSize: _minExtent,
      maxChildSize: _maxExtent,
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
            slivers: [
              SliverFillRemaining(
                hasScrollBody: true,
                child: KeyedSubtree(
                  key: widget.contentKey,
                  child: widget.content,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
