import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/control/splash_controller.dart';
import 'package:todo_app/core/constants/color.dart';
import 'package:todo_app/core/constants/screen_size.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenController());
    return Scaffold(
      body: Center(
        child: Text(
          'T O D O',
          style: TextStyle(
              fontSize: screenWidth! * .0999,
              color: AppColor.primary,
              fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
