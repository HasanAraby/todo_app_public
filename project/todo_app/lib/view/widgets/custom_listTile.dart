import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/control/them_controller.dart';
import 'package:todo_app/core/constants/app_theme.dart';
import 'package:todo_app/core/constants/color.dart';
import 'package:todo_app/core/constants/screen_size.dart';

class CustomListTile extends StatelessWidget {
  final String tit;
  final String subTit;
  const CustomListTile({super.key, required this.tit, required this.subTit});

  @override
  Widget build(BuildContext context) {
    ThemeController controller = Get.find();

    TextStyle? titStyle = controller.mode
        ? lightMode.textTheme.bodyMedium
        : darkMode.textTheme.bodyMedium;
    TextStyle? subTitStyle = controller.mode
        ? lightMode.textTheme.bodySmall
        : darkMode.textTheme.bodySmall;
    return Container(
      height: screenHeight! * .115,
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: screenWidth! * .04),
              child: Text(
                tit,
                style: titStyle,
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: screenWidth! * .04),
              child: Text(
                subTit,
                style: subTitStyle,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: controller.mode ? AppColor.primary : AppColor.white,
            ),
          ),
        ],
      ),
    );
  }
}
