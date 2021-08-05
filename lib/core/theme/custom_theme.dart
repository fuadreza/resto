import 'package:flutter/material.dart';
import 'package:resto/core/theme/app_colors.dart';

@immutable
class CustomTheme {
  final ThemeData light = ThemeData.light().copyWith(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    backgroundColor: AppColors.backgroundLight,
    accentColor: AppColors.white,
    accentIconTheme: IconThemeData(color: AppColors.white),
    dividerColor: Colors.white54,
  );

  final ThemeData dark = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    backgroundColor: AppColors.backgroundDark,
    accentColor: AppColors.black,
    accentIconTheme: IconThemeData(color: AppColors.black),
    dividerColor: Colors.black12,
  );
}
