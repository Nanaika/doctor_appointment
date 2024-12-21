import 'package:doctor_appoinment/ui_kit/colors.dart';
import 'package:flutter/material.dart';

abstract class AppStyles {
  static const displayLarge = TextStyle(
    fontFamily: 'poppins',
    height: 1.3,
    fontSize: 30,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    letterSpacing: -0.24
  );
  static const displayMedium = TextStyle(
      fontFamily: 'poppins',
      height: 2.2,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
  );
  static const bodyMedium = TextStyle(
      fontFamily: 'poppins',
      height: 1.75,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.black,
      letterSpacing: -0.24
  );
  static const bodySmall = TextStyle(
      fontFamily: 'poppins',
      height: 1.33,
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: AppColors.black,
      letterSpacing: -0.24
  );
  static const labelMedium = TextStyle(
      fontFamily: 'poppins',
      height: 1.15,
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: AppColors.primary,
      letterSpacing: -0.24
  );
}
