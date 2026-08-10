import 'api_error_model.dart';
import 'api_errors.dart';
import 'response_code.dart';
import 'package:dio/dio.dart';

enum DataSource {
  noContent,
  badRequest,
  unauthorized,
  forbidden,
  notFound,
  internalServerError,
  connectTimeout,
  sendTimeout,
  receiveTimeout,
  cancel,
  cacheError,
  noInternetConnection,
  unknown,
}

extension DataSourceExtension on DataSource {
  ApiErrorModel get failure {
    switch (this) {
      case DataSource.noContent:
        return const ApiErrorModel(
          code: ResponseCode.created,
          message: ApiErrors.noContent,
        );

      case DataSource.badRequest:
        return const ApiErrorModel(
          code: ResponseCode.badRequest,
          message: ApiErrors.badRequestError,
        );

      case DataSource.unauthorized:
        return const ApiErrorModel(
          code: ResponseCode.unauthorized,
          message: ApiErrors.unauthorizedError,
        );

      case DataSource.forbidden:
        return const ApiErrorModel(
          code: ResponseCode.forbidden,
          message: ApiErrors.forbiddenError,
        );

      case DataSource.notFound:
        return const ApiErrorModel(
          code: ResponseCode.notFound,
          message: ApiErrors.notFoundError,
        );

      case DataSource.internalServerError:
        return const ApiErrorModel(
          code: ResponseCode.internalServerError,
          message: ApiErrors.internalServerError,
        );

      case DataSource.connectTimeout:
        return const ApiErrorModel(
          code: ResponseCode.connectTimeout,
          message: ApiErrors.timeoutError,
        );

      case DataSource.sendTimeout:
        return const ApiErrorModel(
          code: ResponseCode.sendTimeout,
          message: ApiErrors.timeoutError,
        );

      case DataSource.receiveTimeout:
        return const ApiErrorModel(
          code: ResponseCode.receiveTimeout,
          message: ApiErrors.timeoutError,
        );

      case DataSource.cancel:
        return const ApiErrorModel(
          code: ResponseCode.cancel,
          message: ApiErrors.defaultError,
        );

      case DataSource.cacheError:
        return const ApiErrorModel(
          code: ResponseCode.cacheError,
          message: ApiErrors.cacheError,
        );

      case DataSource.noInternetConnection:
        return const ApiErrorModel(
          code: ResponseCode.noInternetConnection,
          message: ApiErrors.noInternetError,
        );

      case DataSource.unknown:
        return const ApiErrorModel(
          code: ResponseCode.unknown,
          message: ApiErrors.defaultError,
        );
    }
  }
}

class ErrorHandler implements Exception {
  final ApiErrorModel apiErrorModel;

  ErrorHandler._(this.apiErrorModel);

  factory ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      return ErrorHandler._(_handleDioException(error));
    }

    return ErrorHandler._(DataSource.unknown.failure);
  }
}

ApiErrorModel _handleDioException(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.connectTimeout.failure;

    case DioExceptionType.sendTimeout:
      return DataSource.sendTimeout.failure;

    case DioExceptionType.receiveTimeout:
      return DataSource.receiveTimeout.failure;

    case DioExceptionType.cancel:
      return DataSource.cancel.failure;

    case DioExceptionType.connectionError:
      return DataSource.noInternetConnection.failure;

    case DioExceptionType.badCertificate:
      return DataSource.unknown.failure;

    case DioExceptionType.badResponse:
      final data = error.response?.data;

      if (data is Map<String, dynamic>) {
        try {
          return ApiErrorModel.fromJson(data);
        } catch (_) {
          return ApiErrorModel(
            code: error.response?.statusCode ?? ResponseCode.unknown,
            message:
                data['message']?.toString() ??
                data['error']?.toString() ??
                ApiErrors.defaultError,
          );
        }
      }

      switch (error.response?.statusCode) {
        case ResponseCode.badRequest:
        case ResponseCode.validationError:
          return DataSource.badRequest.failure;

        case ResponseCode.unauthorized:
          return DataSource.unauthorized.failure;

        case ResponseCode.forbidden:
          return DataSource.forbidden.failure;

        case ResponseCode.notFound:
          return DataSource.notFound.failure;

        case ResponseCode.internalServerError:
          return DataSource.internalServerError.failure;

        default:
          return DataSource.unknown.failure;
      }

    case DioExceptionType.unknown:
      return DataSource.unknown.failure;
  }
}

class ApiInternalStatus {
  ApiInternalStatus._();

  static const int success = 0;
  static const int failure = 1;
}
