import 'dart:async';

import 'package:get/get.dart';
import 'package:todo_app/view/screens/home.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    Timer(const Duration(seconds: 3), () {
      Get.offAll(() => const Home());
    });
    super.onInit();
  }
}
