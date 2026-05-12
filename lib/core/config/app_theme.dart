import 'package:bookly/core/utils/app_colors.dart';
import 'package:bookly/core/utils/app_fonts.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.primaryColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.yellowColor,
      primary: AppColors.yellowColor,
      onPrimary: AppColors.primaryColor,
      surface: AppColors.primaryColor,
      onSurface: AppColors.whiteColor,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 30,
        fontFamily: AppFonts.gTSectra,
        color: AppColors.whiteColor,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        fontFamily: AppFonts.gTSectra,
        color: AppColors.whiteColor,
      ),
      titleLarge: TextStyle(
        fontSize: 18,
        fontFamily: AppFonts.montserratSemiBold,
        color: AppColors.yellowColor,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontFamily: AppFonts.montserratMedium,
        color: AppColors.greyColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontFamily: AppFonts.montserratMedium,
        color: AppColors.whiteColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontFamily: AppFonts.montserratRegular,
        color: AppColors.greyColor,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontFamily: AppFonts.montserratMedium,
        color: AppColors.greyColor,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontFamily: AppFonts.montserratSemiBold,
        color: AppColors.yellowColor,
      ),
      labelMedium: TextStyle(
        fontSize: 15,
        fontFamily: AppFonts.montserratBold,
        color: AppColors.primaryColor,
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.whiteColor,
    ),
  );
}
