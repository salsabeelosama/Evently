import 'package:evently/core/theme/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Apptheme {
  static ThemeData light = ThemeData(
    dividerColor: Appcolors.lightStrokeColor,
    focusColor: Appcolors.whiteColor,
    scaffoldBackgroundColor: Appcolors.lightbackgroundColor,
    primaryColor: Appcolors.lightPrimaryColor,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: Appcolors.lightMainTextColor,
      ),
      titleMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: Appcolors.lightSecTextColor,
      ),
      titleSmall: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: Appcolors.lightPrimaryColor,
      ),
      headlineLarge: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        color: Appcolors.lightPrimaryColor,
      ),
    ),
  );
  static ThemeData dark = ThemeData(
    dividerColor: Appcolors.darkStrokeColor,
    focusColor: Appcolors.darkSmallButtonColor,
    scaffoldBackgroundColor: Appcolors.darkbackgroundColor,
    primaryColor: Appcolors.darkPrimaryColor,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: Appcolors.darkMainTextColor,
      ),
      titleMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: Appcolors.darkSecTextColor,
      ),
      titleSmall: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: Appcolors.darkMainTextColor,
      ),
      headlineLarge: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        color: Appcolors.darkMainTextColor,
      ),
    ),
  );
}
