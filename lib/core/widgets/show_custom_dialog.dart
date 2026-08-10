// import '../themes/app_text_styles.dart';
// import '../themes/colors_manager.dart';
// import 'app_button_widget.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// Future<void> showCustomAlertDialog({
//   required BuildContext context,
//   required String title,
//   required String content,
//   required String cancelText,
//   required String confirmText,
//   required VoidCallback? onCancel,
//   required VoidCallback onConfirm,
//   Widget? customContent,
// }) {
//   return showDialog(
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//         backgroundColor: ColorsManager.neutral100,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12.r),
//         ),
//         title: Text(
//           tr(title),
//           style: TextStyles.textStyleExtraBold16.copyWith(
//             color: ColorsManager.secondary1_500,
//           ),
//           textAlign: TextAlign.center,
//         ),
//         content:
//             customContent ??
//             Text(
//               tr(content),
//               style: TextStyles.textStyleRegular12.copyWith(
//                 color: ColorsManager.neutral800,
//               ),
//               textAlign: TextAlign.center,
//             ),
//         actionsAlignment: MainAxisAlignment.center,
//         actionsPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
//         actions: [
//           Row(
//             children: [
//               Expanded(
//                 flex: 3,
//                 child: AppButtonWidget(
//                   backgroundColor: ColorsManager.primary500,
//                   borderColor: ColorsManager.primary500,
//                   text: confirmText,
//                   onTap: onConfirm,
//                   textStyle: TextStyles.textStyleBold16.copyWith(
//                     color: ColorsManager.neutral50,
//                   ),
//                 ),
//               ),
//               8.horizontalSpace,
//               Expanded(
//                 flex: 2,
//                 child: AppButtonWidget(
//                   backgroundColor: ColorsManager.neutral50,
//                   borderColor: ColorsManager.primary500,
//                   text: cancelText,
//                   textStyle: TextStyles.textStyleBold16.copyWith(
//                     color: ColorsManager.primary500,
//                   ),
//                   onTap: onCancel ?? Navigator.of(context).pop,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       );
//     },
//   );
// }
