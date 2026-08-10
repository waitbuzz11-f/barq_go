// import 'package:base_stracure/core/resources/image_manager.dart';
// import 'package:base_stracure/core/themes/colors_manager.dart';
// import 'package:base_stracure/core/widgets/app_svg_handler.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class FavoriteButton extends StatelessWidget {
//   final bool isFavorite;
//   final VoidCallback? onPressed;

//   const FavoriteButton({super.key, required this.isFavorite, this.onPressed});

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       type: MaterialType.transparency,
//       child: InkWell(
//         borderRadius: BorderRadius.circular(100.r),
//         onTap: onPressed,
//         child: Ink(
//           height: 28.h,
//           width: 28.w,
//           padding: EdgeInsets.all(4.r),
//           decoration: const BoxDecoration(
//             color: Colors.white,
//             shape: BoxShape.circle,
//           ),
//           child: AppSvgHandler(
//             assetPath: isFavorite
//                 ? ImageManager.favoriteFilled
//                 : ImageManager.favoriteOutlined,
//             color: isFavorite
//                 ? ColorsManager.primary500
//                 : ColorsManager.neutral800,
//           ),
//         ),
//       ),
//     );
//   }
// }
