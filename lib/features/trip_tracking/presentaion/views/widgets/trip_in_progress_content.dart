import 'dart:async';

import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_button_widget.dart';
import 'package:barq_go/core/widgets/app_svg_handler.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TripInProgressContent extends StatefulWidget {
  const TripInProgressContent({super.key, required this.onCompleted});

  final VoidCallback onCompleted;

  @override
  State<TripInProgressContent> createState() => _TripInProgressContentState();
}

class _TripInProgressContentState extends State<TripInProgressContent> {
  Timer? _timer;
  bool _completionScheduled = false;
  bool _didNotifyCompletion = false;

  final int totalMinutes = 19;
  int elapsedSeconds = 0;

  int get totalSeconds => totalMinutes * 60;

  double get progress {
    if (totalSeconds == 0) return 0;
    return (elapsedSeconds / totalSeconds).clamp(0.0, 1.0);
  }

  int get remainingMinutes {
    final remainingSeconds = totalSeconds - elapsedSeconds;
    return (remainingSeconds / 60).ceil();
  }

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 1), _onTimerTick);
  }

  void _onTimerTick(Timer timer) {
    if (!mounted) {
      timer.cancel();
      return;
    }

    final nextElapsedSeconds = elapsedSeconds + 1;
    if (nextElapsedSeconds >= totalSeconds) {
      timer.cancel();
      setState(() => elapsedSeconds = totalSeconds);
      _scheduleCompletion();
      return;
    }

    setState(() => elapsedSeconds = nextElapsedSeconds);
  }

  void _scheduleCompletion() {
    if (_completionScheduled) return;
    _completionScheduled = true;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || _didNotifyCompletion) return;
      _didNotifyCompletion = true;
      widget.onCompleted();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("trip_in_progress".tr(), style: TextStyles.textStyleBold16),
            Text(
              "-$remainingMinutes ${'minutes'.tr()}",
              style: TextStyles.textStyleSemiBold14.copyWith(
                color: ColorsManager.brandPrimary,
              ),
            ),
          ],
        ),

        12.verticalSpace,

        ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 8.h,
            backgroundColor: ColorsManager.surfaceSecondary,
            valueColor: const AlwaysStoppedAnimation(
              ColorsManager.brandPrimary,
            ),
          ),
        ),

        12.verticalSpace,

        Text(
          "trip_route_example".tr(),
          style: TextStyles.textStyleRegular12.copyWith(
            color: ColorsManager.textSecondary,
          ),
        ),

        12.verticalSpace,

        Row(
          children: [
            Expanded(
              child: AppButtonWidget(
                text: "sos",
                icon: AppSvgHandler(
                  assetPath: Assets.assetsImagesIconsPrivacy,
                  color: ColorsManager.danger,
                ),
                textColor: ColorsManager.danger,
                backgroundColor: ColorsManager.lightDanger.withAlpha(8),
                borderColor: ColorsManager.danger,
              ),
            ),
            8.horizontalSpace,
            Expanded(
              child: AppButtonWidget(
                text: "chat",
                icon: AppSvgHandler(assetPath: Assets.assetsImagesIconsChat),
                textColor: ColorsManager.darkBackground,
                backgroundColor: ColorsManager.surfaceSecondary,
                borderColor: ColorsManager.border,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
