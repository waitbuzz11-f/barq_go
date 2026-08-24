import 'package:barq_go/features/trip_tracking/data/models/form_field_item.dart';

abstract final class FormDeliverDummyData {
  static const List<FormFieldItem> fields = [
    FormFieldItem(
      id: 1,
      key: 'sender_name',
      title: 'sender_name',
      type: FormFieldType.text,
      isRequired: true,
    ),

    FormFieldItem(
      id: 2,
      key: 'receiver_name',
      title: 'receiver_name',
      type: FormFieldType.text,
      isRequired: true,
    ),

    FormFieldItem(
      id: 3,
      key: 'receiver_phone',
      title: 'receiver_phone',
      type: FormFieldType.phone,
      isRequired: true,
    ),

    FormFieldItem(
      id: 4,
      key: 'package_category',
      title: 'package_category',
      type: FormFieldType.options,
      isRequired: true,
      options: [
        FormOptionItem(id: 1, title: 'documents'),
        FormOptionItem(id: 2, title: 'clothes'),
        FormOptionItem(id: 3, title: 'electronics'),
        FormOptionItem(id: 4, title: 'food'),
        FormOptionItem(id: 5, title: 'other'),
      ],
    ),

    FormFieldItem(
      id: 5,
      key: 'size',
      title: 'size',
      type: FormFieldType.radio,
      isRequired: true,
      options: [
        FormOptionItem(id: 1, title: 'small'),
        FormOptionItem(id: 2, title: 'medium'),
        FormOptionItem(id: 3, title: 'large'),
      ],
    ),

    FormFieldItem(
      id: 6,
      key: 'is_fragile',
      title: 'fragile_package_needs_care',
      type: FormFieldType.boolean,
      isRequired: false,
    ),

    FormFieldItem(
      id: 7,
      key: 'notes',
      title: 'notes_optional',
      type: FormFieldType.textarea,
      isRequired: false,
    ),
  ];
}
