import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/color.dart';
import 'package:todo_app/core/constants/screen_size.dart';
import 'package:todo_app/core/functions/font_size.dart';

final ThemeData lightMode = ThemeData(
  textTheme: TextTheme(
    headlineSmall: const TextStyle(
      fontSize: 28,
      color: AppColor.white,
    ),
    bodySmall: TextStyle(
      fontSize: getFontSize(screenWidth! * .05, screenWidth! * .05,
          screenWidth! * .035, screenWidth! * .035),
      color: const Color.fromARGB(255, 2, 1, 1),
    ),
    bodyMedium: TextStyle(
      fontSize: getFontSize(screenWidth! * .07, screenWidth! * .07,
          screenWidth! * .06, screenWidth! * .06),
      color: AppColor.black,
      fontWeight: FontWeight.w500,
    ),
  ),
  appBarTheme: AppBarTheme(
    color: AppColor.primary,
    iconTheme: const IconThemeData(color: AppColor.white),
    titleTextStyle: TextStyle(
      fontSize: getFontSize(screenWidth! * .09, screenWidth! * .09,
          screenWidth! * .07, screenWidth! * .07),
      color: AppColor.white,
    ),
    centerTitle: true,
    toolbarHeight: getFontSize(screenWidth! * .12, screenWidth! * .12,
        screenWidth! * .1, screenWidth! * .1),
  ),
  iconTheme: IconThemeData(
    size: getFontSize(screenWidth! * .07, screenWidth! * .07,
        screenWidth! * .07, screenWidth! * .07),
  ),
  brightness: Brightness.light,
);

final ThemeData darkMode = ThemeData(
  textTheme: TextTheme(
    headlineSmall: const TextStyle(
      fontSize: 28,
      color: AppColor.white,
    ),
    bodySmall: TextStyle(
      fontSize: getFontSize(screenWidth! * .05, screenWidth! * .05,
          screenWidth! * .035, screenWidth! * .035),
      color: AppColor.white,
    ),
    bodyMedium: TextStyle(
      fontSize: getFontSize(screenWidth! * .07, screenWidth! * .07,
          screenWidth! * .06, screenWidth! * .06),
      color: AppColor.white,
      fontWeight: FontWeight.w500,
    ),
  ),
  appBarTheme: AppBarTheme(
    color: AppColor.primary,
    iconTheme: IconThemeData(color: AppColor.white),
    titleTextStyle: TextStyle(
      fontSize: getFontSize(screenWidth! * .09, screenWidth! * .09,
          screenWidth! * .07, screenWidth! * .07),
      color: AppColor.white,
    ),
    centerTitle: true,
    toolbarHeight: getFontSize(screenWidth! * .12, screenWidth! * .12,
        screenWidth! * .1, screenWidth! * .1),
  ),
  iconTheme: IconThemeData(
    size: getFontSize(screenWidth! * .07, screenWidth! * .07,
        screenWidth! * .07, screenWidth! * .07),
  ),
  brightness: Brightness.dark,
);
