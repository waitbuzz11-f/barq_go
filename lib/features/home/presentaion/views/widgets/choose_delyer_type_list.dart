import 'package:barq_go/core/resources/image_manager.dart';
import 'package:barq_go/core/themes/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseDeliveryTypeList extends StatefulWidget {
  const ChooseDeliveryTypeList({super.key});

  @override
  State<ChooseDeliveryTypeList> createState() => _ChooseDeliveryTypeListState();
}

class _ChooseDeliveryTypeListState extends State<ChooseDeliveryTypeList> {
  int currentIndex = 0;

  final List<String> deliveryTypes = [
    Assets.assetsImagesPngCar,
    Assets.assetsImagesPngPackge,
    Assets.assetsImagesPngTard,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: deliveryTypes.length,
        separatorBuilder: (_, __) => 12.horizontalSpace,
        itemBuilder: (context, index) {
          final isSelected = currentIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
              });
            },
            child: ChooseDeliveryTypeCard(
              isSelected: isSelected,
              image: deliveryTypes[index],
            ),
          );
        },
      ),
    );
  }
}

class ChooseDeliveryTypeCard extends StatelessWidget {
  const ChooseDeliveryTypeCard({
    super.key,
    required this.isSelected,
    required this.image,
  });

  final bool isSelected;
  final String image;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 111.w,
      height: 62.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: isSelected
              ? ColorsManager.brandPrimary
              : ColorsManager.darkLight.withAlpha(6),
        ),
        color: isSelected
            ? ColorsManager.brandPrimary
            : ColorsManager.surfaceSecondary,
      ),
      child: Image.asset(image, width: 36.w, height: 26.h, fit: BoxFit.contain),
    );
  }
}
