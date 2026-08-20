import 'package:barq_go/features/referral_program/presentaion/views/widgets/how_app_work_list.dart';
import 'package:barq_go/features/referral_program/presentaion/views/widgets/invite_friend_card.dart';
import 'package:barq_go/features/referral_program/presentaion/views/widgets/referral_history_list.dart';
import 'package:barq_go/features/referral_program/presentaion/views/widgets/share_code_Card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReferralProgramView extends StatelessWidget {
  const ReferralProgramView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            InviteFriendCard(),
            ShareCodeCard(),
            16.verticalSpace,
            HowAppWorkList(),
            16.verticalSpace,
            ReferralHistoryList(),
          ],
        ),
      ),
    );
  }
}
