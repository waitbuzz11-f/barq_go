import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/features/trip_tracking/data/repos/form_deliver_dummy_data.dart';
import 'package:barq_go/features/trip_tracking/presentaion/views/widgets/form_deliver_type/dynamic_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormDeliverTypeContent extends StatefulWidget {
  const FormDeliverTypeContent({super.key});

  @override
  State<FormDeliverTypeContent> createState() => _FormDeliverTypeContentState();
}

class _FormDeliverTypeContentState extends State<FormDeliverTypeContent> {
  final Map<String, dynamic> values = {};

  @override
  Widget build(BuildContext context) {
    final fields = FormDeliverDummyData.fields;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("package_details".tr(), style: TextStyles.textStyleBold15),

        16.verticalSpace,

        ...List.generate(fields.length, (index) {
          final field = fields[index];

          return Padding(
            padding: EdgeInsets.only(
              bottom: index == fields.length - 1 ? 0 : 20.h,
            ),
            child: DynamicFormField(
              field: field,
              value: values[field.key],
              onChanged: (value) {
                setState(() {
                  values[field.key] = value;
                });
              },
            ),
          );
        }),
        Text(
          "who_pays_delivery".tr(),
          style: TextStyles.textStyleRegular12.copyWith(
            color: ColorsManager.textSecondary,
          ),
        ),
        8.verticalSpace,
        // Row(
        //   children: [
        //     Expanded(
        //       child: AppButtonWidget(
        //         text: "receiver",
        //         backgroundColor: ColorsManager.surfaceSecondary,
        //         borderColor: ColorsManager.border,
        //       ),
        //     ),
        //     8.horizontalSpace,
        //     Expanded(
        //       child: AppButtonWidget(
        //         text: "sender",
        //         textColor: ColorsManager.surfacePrimary,
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
