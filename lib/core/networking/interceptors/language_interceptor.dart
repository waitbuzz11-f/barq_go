import '../../routing/app_navigator.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final language = navigatorKey.currentContext?.locale.languageCode ?? 'en';

    options.headers['Accept-Language'] = language;

    handler.next(options);
  }
}
