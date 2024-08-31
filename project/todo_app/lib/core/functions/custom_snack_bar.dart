import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/constants/app_theme.dart';
import 'package:todo_app/core/constants/color.dart';

void customSnackBar(String message) {
  Get.showSnackbar(GetSnackBar(
    // message: message,
    messageText: Text(
      message,
      style: darkMode.textTheme.bodySmall!,
    ),
    duration: const Duration(seconds: 2),
    backgroundColor: AppColor.primary,
  ));
}
