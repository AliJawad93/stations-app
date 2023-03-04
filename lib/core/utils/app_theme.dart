import 'package:flutter/material.dart';
import 'package:station/core/utils/app_colors.dart';

class AppTheme {
  static ThemeData themeData() {
    return ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: _appBarTheme(),
        inputDecorationTheme: _inputDecorationTheme(),
        elevatedButtonTheme: _elevatedButtonTheme());
  }

  static AppBarTheme _appBarTheme() {
    return AppBarTheme(
      backgroundColor: AppColors.primary,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(fontSize: 25, color: AppColors.white),
    );
  }

  static InputDecorationTheme _inputDecorationTheme() {
    return InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      focusColor: AppColors.white,
      prefixIconColor: AppColors.gray,
      suffixIconColor: AppColors.gray,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.gray, width: 1.5),
        // borderRadius: BorderRadius.circular(5),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.white, width: 1.5),
        //borderRadius: BorderRadius.circular(5),
      ),
      hintStyle: TextStyle(color: AppColors.gray),
    );
  }

  static ElevatedButtonThemeData _elevatedButtonTheme() {
    return ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5), // <-- Radius
      ),
    ));
  }
}
