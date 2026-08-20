import 'package:barq_go/features/notification/presentaion/views/widgets/notfications_header.dart';
import 'package:barq_go/features/notification/presentaion/views/widgets/notifications_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            NotficationsHeader(),
            16.verticalSpace,
            Padding(padding: EdgeInsets.all(16.r), child: NotificationsList()),
          ],
        ),
      ),
    );
  }
}
