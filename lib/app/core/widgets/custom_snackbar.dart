import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/colors.dart';
import '../theme/layout_space.dart';

abstract class CustomSnackBar {
  static showSnackBar(String text, BuildContext? context,
      {String title = "Attention!", Function? onTap}) {
    Get.snackbar(title, text,
        dismissDirection: DismissDirection.horizontal,
        margin: const EdgeInsets.only(
          top: layoutSpace16,
          left: layoutSpace16,
          right: layoutSpace16,
          bottom: layoutSpace16,
        ),
        colorText: Colors.white,
        backgroundColor: AppColors.secondary,
        animationDuration: const Duration(milliseconds: 500),
        duration: const Duration(seconds: 4),
        snackPosition: SnackPosition.BOTTOM,
        onTap: (value) => onTap?.call());
  }
}
