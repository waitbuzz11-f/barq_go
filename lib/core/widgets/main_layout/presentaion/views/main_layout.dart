import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/themes/app_text_styles.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:barq_go/core/widgets/app_svg_handler.dart';
import 'package:barq_go/core/widgets/main_layout/presentaion/cubit/main_layout_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = const [
      SizedBox(),
      SizedBox(),
      SizedBox(),
      SizedBox(),
    ];

    return BlocProvider(
      create: (_) => MainLayoutCubit(),
      child: BlocBuilder<MainLayoutCubit, int>(
        builder: (context, currentIndex) {
          return Scaffold(
            backgroundColor: ColorsManager.surfacePrimary,
            body: IndexedStack(index: currentIndex, children: screens),
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
              ),
              child: BottomNavigationBar(
                elevation: 0,
                currentIndex: currentIndex,
                onTap: context.read<MainLayoutCubit>().changeIndex,
                type: BottomNavigationBarType.fixed,
                backgroundColor: ColorsManager.surfacePrimary,
                selectedItemColor: ColorsManager.brandPrimary,
                unselectedItemColor: ColorsManager.textSecondary,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                selectedLabelStyle: TextStyles.textStyleBold11,
                unselectedLabelStyle: TextStyles.textStyleBold11,
                items: [
                  _buildNavItem(
                    icon: Assets.assetsImagesIconsTrips,
                    label: 'home'.tr(),
                  ),
                  _buildNavItem(
                    icon: Assets.assetsImagesIconsTrips,
                    label: 'my_trips'.tr(),
                  ),
                  _buildNavItem(
                    icon: Assets.assetsImagesIconsWallet,
                    label: 'wallet'.tr(),
                  ),
                  _buildNavItem(
                    icon: Assets.assetsImagesIconsProfile,
                    label: 'my_account'.tr(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem({
    required String icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: _buildIcon(icon),
      activeIcon: _buildIcon(icon),
      label: label,
    );
  }

  Widget _buildIcon(String assetPath) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: AppSvgHandler(assetPath: assetPath),
    );
  }
}
