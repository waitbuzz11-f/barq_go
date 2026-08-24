import 'package:barq_go/core/routing/app_navigator.dart';
import 'package:barq_go/core/routing/app_router.dart';
import 'package:barq_go/core/routing/routes.dart';
import 'package:barq_go/core/themes/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BarqGo extends StatelessWidget {
  const BarqGo({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: const TextScaler.linear(1)),
          child: child!,
        );
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'barq_go'.tr(),
        initialRoute: Routes.splash,
        onGenerateRoute: appRouter.generateRoute,
        navigatorKey: navigatorKey,
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
