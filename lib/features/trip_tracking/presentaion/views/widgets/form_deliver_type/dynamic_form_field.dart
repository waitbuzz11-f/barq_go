import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/widgets/app_text_field.dart';
import 'package:barq_go/features/trip_tracking/data/models/form_field_item.dart';
import 'package:barq_go/features/trip_tracking/presentaion/views/widgets/form_deliver_type/fragile_package_card_form.dart';
import 'package:barq_go/features/trip_tracking/presentaion/views/widgets/form_deliver_type/selectable_option_Card_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DynamicFormField extends StatelessWidget {
  const DynamicFormField({
    super.key,
    required this.field,
    required this.value,
    required this.onChanged,
  });

  final FormFieldItem field;
  final dynamic value;
  final ValueChanged<dynamic> onChanged;

  @override
  Widget build(BuildContext context) {
    switch (field.type) {
      case FormFieldType.text:
        return AppTextFormField(
          hintText: field.title.tr(),
          onChanged: onChanged,
        );

      case FormFieldType.phone:
        return AppTextFormField(
          hintText: field.title.tr(),
          keyboardType: TextInputType.phone,
          onChanged: onChanged,
        );

      case FormFieldType.textarea:
        return AppTextFormField(
          hintText: field.title.tr(),
          maxLines: 4,
          onChanged: onChanged,
        );

      case FormFieldType.options:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(field.title.tr(), style: TextStyles.textStyleBold15),
            12.verticalSpace,
            Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children: field.options.map((option) {
                return SelectableOptionCardForm(
                  title: option.title.tr(),
                  isSelected: value == option.id,
                  onTap: () {
                    onChanged(option.id);
                  },
                );
              }).toList(),
            ),
          ],
        );

      case FormFieldType.radio:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(field.title.tr(), style: TextStyles.textStyleBold15),
            12.verticalSpace,
            Row(
              children: List.generate(field.options.length, (index) {
                final option = field.options[index];

                return Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(
                      end: index == field.options.length - 1 ? 0 : 8.w,
                    ),
                    child: SelectableOptionCardForm(
                      title: option.title.tr(),
                      isSelected: value == option.id,
                      onTap: () {
                        onChanged(option.id);
                      },
                    ),
                  ),
                );
              }),
            ),
          ],
        );

      case FormFieldType.boolean:
        return FragilePackageCardForm(
          isSelected: value ?? false,
          onTap: () {
            onChanged(!(value ?? false));
          },
        );
    }
  }
}
