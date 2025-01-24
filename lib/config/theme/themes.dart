import 'package:flutter/material.dart';

import 'app_colors.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: false,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
  scaffoldBackgroundColor: AppColors.scaffoldWhite,
  appBarTheme: const AppBarTheme(
    scrolledUnderElevation: 4,
    elevation: 0,
    backgroundColor: AppColors.scaffoldWhite,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
        foregroundColor: Colors.blue,
        textStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        )),
  ),
);
