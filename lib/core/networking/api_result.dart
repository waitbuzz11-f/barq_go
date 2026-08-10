import '../errors/api_error_model.dart';

sealed class ApiResult<T> {
  const ApiResult();
}

final class Success<T> extends ApiResult<T> {
  final T data;

  const Success(this.data);
}

final class Failure<T> extends ApiResult<T> {
  final ApiErrorModel error;

  const Failure(this.error);
}
