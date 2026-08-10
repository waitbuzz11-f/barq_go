import 'api_errors.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final String message;
  final int code;

  const ApiErrorModel({required this.message, required this.code});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  factory ApiErrorModel.unknown() {
    return const ApiErrorModel(code: -1, message: ApiErrors.defaultError);
  }

  @override
  String toString() => 'ApiErrorModel(code: $code, message: $message)';
}
