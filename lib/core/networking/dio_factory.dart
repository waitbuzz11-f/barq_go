import 'package:dio/dio.dart';
import 'package:dio_logger_plus/dio_logger_plus.dart';
import 'package:flutter/foundation.dart';

import 'interceptors/auth_interceptor.dart';
import 'interceptors/language_interceptor.dart';

class DioFactory {
  DioFactory._();

  static const Duration _timeout = Duration(seconds: 30);

  static Dio createDio() {
    final dio = Dio(
      BaseOptions(
        connectTimeout: _timeout,
        receiveTimeout: _timeout,
        sendTimeout: _timeout,
        headers: const {'Accept': 'application/json'},
      ),
    );

    _addInterceptors(dio);

    return dio;
  }

  static void _addInterceptors(Dio dio) {
    // Interceptors used in all environments
    dio.interceptors.addAll([AuthInterceptor(), LanguageInterceptor()]);

    // Logger only in debug mode
    if (kDebugMode) {
      dio.interceptors.add(
        DioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          error: true,
        ),
      );
    }
  }
}
