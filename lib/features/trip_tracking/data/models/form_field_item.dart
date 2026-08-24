enum FormFieldType { text, phone, options, radio, boolean, textarea }

class FormFieldItem {
  final int id;
  final String key;
  final String title;
  final FormFieldType type;
  final bool isRequired;
  final List<FormOptionItem> options;

  const FormFieldItem({
    required this.id,
    required this.key,
    required this.title,
    required this.type,
    required this.isRequired,
    this.options = const [],
  });
}

class FormOptionItem {
  final int id;
  final String title;

  const FormOptionItem({required this.id, required this.title});
}
