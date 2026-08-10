import '../../di/dependency_injection.dart';
import '../../helper/constants.dart';
import '../../helper/session_manager.dart';
import '../../helper/shared_pref_helper.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await SharedPrefHelper.getSecuredString(SharedPrefKeys.token);
    if (token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    } else {
      options.headers.remove('Authorization');
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      getIt<SessionManager>().onSessionExpired();
    }
    handler.next(err);
  }
}
