import 'package:barq_go/core/widgets/custom_app_bar.dart';
import 'package:barq_go/features/help_center/presentation/views/widgets/help_center_list.dart';
import 'package:barq_go/features/help_center/presentation/views/widgets/warning_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpCenterView extends StatelessWidget {
  const HelpCenterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'help_center'),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          children: [WarningCard(), 12.verticalSpace, HelpCenterList()],
        ),
      ),
    );
  }
}
