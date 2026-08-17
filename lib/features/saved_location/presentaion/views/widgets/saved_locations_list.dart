import 'package:barq_go/features/saved_location/presentaion/views/widgets/delete_location_dialog.dart';
import 'package:barq_go/features/saved_location/presentaion/views/widgets/saved_location_card_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SavedLocationsList extends StatelessWidget {
  SavedLocationsList({super.key});

  final List<String> titles = ["home", "work"];

  final List<String> subTitles = ["home_address", "work_address"];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return SavedLocationCardData(
            title: titles[index],
            subTitle: subTitles[index],
            onDelete: () {
              // delete location
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return DeleteLocationDialog();
                },
              );
            },
            onEdit: () {
              // edit location
            },
          );
        },
        separatorBuilder: (context, index) {
          return 8.verticalSpace;
        },
      ),
    );
  }
}
