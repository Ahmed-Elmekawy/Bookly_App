import 'package:bookly/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class UiUtils {
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.yellowColor,
      ),
    );
  }
}

