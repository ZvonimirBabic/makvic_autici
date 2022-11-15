import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';

class MySnackbars {
  static void showSuccessSnackbar({
    required String message,
    Color backgroundColor = MakvicAuticiColors.primaryLightBlue,
    IconData icon = Icons.check,
  }) =>
      Get.rawSnackbar(
        backgroundColor: backgroundColor,
        icon: Icon(
          icon,
          color: MakvicAuticiColors.primaryLightBlue,
        ),
        message: message,
        margin: EdgeInsets.all(32.r),
        padding: EdgeInsets.all(24.r),
        borderRadius: 16.r,
      );

  static void showErrorSnackbar({
    required String message,
    Color backgroundColor = MakvicAuticiColors.primaryLightBlue,
    IconData icon = Icons.close,
  }) =>
      Get.rawSnackbar(
        backgroundColor: backgroundColor,
        icon: Icon(
          icon,
          color: MakvicAuticiColors.primaryLightBlue,
        ),
        message: message,
        margin: EdgeInsets.all(32.r),
        padding: EdgeInsets.all(24.r),
        borderRadius: 16.r,
      );
}
