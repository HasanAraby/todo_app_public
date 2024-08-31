import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/functions/initiate_screen_size.dart';
import 'package:todo_app/core/services/services.dart';
import 'package:todo_app/view/screens/splash_screen.dart';
import 'control/them_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  // runApp(DevicePreview(builder: (context) => const MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    intiateScreenSize(MediaQuery.of(context));

    ThemeController controller = Get.put(ThemeController());
    return GetMaterialApp(
      // builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: controller.appThem,
    );
  }
}
