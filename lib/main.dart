import 'package:barq_go/barq_go.dart';
import 'package:barq_go/core/di/dependency_injection.dart';
import 'package:barq_go/core/helper/bloc_observer.dart';
import 'package:barq_go/core/helper/constants.dart';
import 'package:barq_go/core/helper/extensions.dart';
import 'package:barq_go/core/helper/shared_pref_helper.dart';
import 'package:barq_go/core/routing/app_router.dart';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await checkIfLoggedInUser();
  await setupGetIt();
  Bloc.observer = MyBlocObserver();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations/',
      fallbackLocale: const Locale('en'),
      startLocale: WidgetsBinding.instance.platformDispatcher.locale,
      saveLocale: true,
      useOnlyLangCode: true,
      child: BarqGo(appRouter: AppRouter()),
    ),
  );
}

Future<void> checkIfLoggedInUser() async {
  String? userToken = await SharedPrefHelper.getSecuredString(
    SharedPrefKeys.token,
  );
  if (!userToken.isNullOrEmpty) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
