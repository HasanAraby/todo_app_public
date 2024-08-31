import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/constants/app_theme.dart';
import 'package:todo_app/core/services/services.dart';

class ThemeController extends GetxController {
  late bool mode;
  late ThemeData appThem;

  MyServices services = Get.find();

  void changeMode() {
    mode ^= true;
    services.sharedPreferences.setBool('mode', mode);
    appTheme();
    appMode();
    Get.changeTheme(appThem);
  }

  ThemeData appMode() {
    if (mode) return ThemeData.light();
    return ThemeData.dark();
  }

  void appTheme() {
    if (mode) {
      appThem = lightMode;
    } else {
      appThem = darkMode;
    }
  }

  @override
  void onInit() {
    bool? x = services.sharedPreferences.getBool('mode');
    if (x == null || x == true) {
      x = true;
    } else {
      x = false;
    }

    mode = x;

    appThem = mode ? lightMode : darkMode;

    super.onInit();
  }
}
