import 'package:barq_go/core/di/dependency_injection.dart';
import 'package:barq_go/core/routing/routes.dart';
import 'package:barq_go/core/widgets/main_layout/presentaion/cubit/main_layout_cubit.dart';
import 'package:barq_go/core/widgets/main_layout/presentaion/views/main_layout.dart';
import 'package:barq_go/features/add_balance/presentaion/view/add_balance_status.dart';
import 'package:barq_go/features/add_balance/presentaion/view/add_balance_view.dart';
import 'package:barq_go/features/auth/presentaion/cubit/auth_cubit.dart';
import 'package:barq_go/features/auth/presentaion/views/login_view.dart';
import 'package:barq_go/features/auth/presentaion/views/otp_view.dart';
import 'package:barq_go/features/detect_location/presentaion/views/detect_location_view.dart';
import 'package:barq_go/features/edit_profile.dart/presentaion/views/edit_profile_view.dart';
import 'package:barq_go/features/home/presentaion/views/home_view.dart';
import 'package:barq_go/features/location_policy/presentaion/views/widgets/location_policy.dart';
import 'package:barq_go/features/my_trips/presentaion/views/my_trips_view.dart';
import 'package:barq_go/features/onboarding/presentation/views/omboarding_view.dart';
import 'package:barq_go/features/profile/presentaion/views/profile_view.dart';
import 'package:barq_go/features/saved_location/presentaion/views/saved_location_view.dart';
import 'package:barq_go/features/splash/presenation/views/splash_view.dart';
import 'package:barq_go/features/wallet/presentaion/views/wallet_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  const AppRouter();

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // splash
      case Routes.splash:
        return _fadeRoute(const SplashView(), settings);
      // onboarding
      case Routes.onboarding:
        return _fadeRoute(const OnboardingView(), settings);
      // login
      case Routes.login:
        return _fadeRoute(
          BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: const LoginView(),
          ),
          settings,
        );
      // otp
      case Routes.otp:
        return _fadeRoute(const OtpView(), settings);
      // location Policy
      case Routes.locationPolicy:
        return _fadeRoute(const LocationPolicy(), settings);
      // main layout
      case Routes.mainLayout:
        return _fadeRoute(
          BlocProvider(
            create: (context) => getIt<MainLayoutCubit>(),
            child: const MainLayout(),
          ),
          settings,
        );
      // home
      case Routes.home:
        return _fadeRoute(
          BlocProvider(
            create: (context) => getIt<MainLayoutCubit>(),
            child: const HomeView(),
          ),
          settings,
        );
      // detect location
      case Routes.detectLocation:
        return _fadeRoute(const DetectLocationView(), settings);
      // my trips
      case Routes.myTrips:
        return _fadeRoute(
          BlocProvider(
            create: (context) => getIt<MainLayoutCubit>(),
            child: const MyTripsView(),
          ),
          settings,
        );

      case Routes.wallet:
        return _fadeRoute(
          BlocProvider(
            create: (context) => getIt<MainLayoutCubit>(),
            child: const WalletView(),
          ),
          settings,
        );

      // add balance
      case Routes.addBalance:
        return _fadeRoute(const AddBalanceView(), settings);

      // add balance status
      case Routes.addBalanceStatus:
        return _fadeRoute(const AddBalanceStatus(), settings);

      // profile view
      case Routes.profileView:
        return _fadeRoute(
          BlocProvider(
            create: (context) => getIt<MainLayoutCubit>(),
            child: const ProfileView(),
          ),
          settings,
        );
  
      // edit profile
      case Routes.editProfile:
        return _fadeRoute(const EditProfileView(), settings);

      // saved location
      case Routes.savedLocation:
        return _fadeRoute(const SavedLocationView(), settings);
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route Not Found'))),
        );
    }
  }

  // ==========================
  // Route Animations
  // ==========================

  PageRoute _fadeRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, animation, __, child) {
        return FadeTransition(opacity: animation, child: child);
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  // PageRoute _slideRoute(Widget page, RouteSettings settings) {
  //   return PageRouteBuilder(
  //     settings: settings,
  //     pageBuilder: (_, __, ___) => page,
  //     transitionsBuilder: (_, animation, __, child) {
  //       return SlideTransition(
  //         position: Tween<Offset>(
  //           begin: const Offset(1, 0),
  //           end: Offset.zero,
  //         ).animate(animation),
  //         child: child,
  //       );
  //     },
  //     transitionDuration: const Duration(milliseconds: 300),
  //   );
  // }

  // PageRoute _slideFromBottomRoute(Widget page, RouteSettings settings) {
  //   return PageRouteBuilder(
  //     settings: settings,
  //     pageBuilder: (_, __, ___) => page,
  //     transitionsBuilder: (_, animation, __, child) {
  //       return SlideTransition(
  //         position: Tween<Offset>(
  //           begin: const Offset(0, 1),
  //           end: Offset.zero,
  //         ).animate(animation),
  //         child: child,
  //       );
  //     },
  //     transitionDuration: const Duration(milliseconds: 300),
  //   );
  // }
}
