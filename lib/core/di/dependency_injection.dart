import 'package:barq_go/core/widgets/main_layout/presentaion/cubit/main_layout_cubit.dart';
import 'package:barq_go/features/auth/presentaion/cubit/auth_cubit.dart';

import '../helper/session_manager.dart';
import '../networking/api_constants.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio
  getIt.registerLazySingleton<Dio>(DioFactory.createDio);

  // ApiService
  getIt.registerLazySingleton<ApiService>(
    () => ApiService(getIt<Dio>(), baseUrl: ApiConstants.apiBaseUrl),
  );

  // Session lifecycle
  getIt.registerLazySingleton<SessionManager>(
    () => SessionManager(getIt<Dio>()),
  );

  //// Singelton Repositories and  Factory Cubits

  // auth
  getIt.registerFactory<AuthCubit>(() => AuthCubit());
  // main layout
  getIt.registerFactory<MainLayoutCubit>(() => MainLayoutCubit());
}
