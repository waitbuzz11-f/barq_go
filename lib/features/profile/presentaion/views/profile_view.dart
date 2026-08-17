import 'package:barq_go/features/profile/presentaion/views/widgets/profile_header.dart';
import 'package:barq_go/features/profile/presentaion/views/widgets/profile_options_list.dart';
import 'package:barq_go/features/profile/presentaion/views/widgets/profile_statics_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: SafeArea(
        child: Column(
          children: [
            ProfileHeader(),
            16.verticalSpace,
            ProfileStaticsList(),
            16.verticalSpace,
            ProfileOptionsList(),
          ],
        ),
      ),
    );
  }
}
