import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/control/them_controller.dart';
import 'package:todo_app/core/constants/color.dart';
import 'package:todo_app/core/constants/screen_size.dart';
import 'package:todo_app/core/functions/font_size.dart';

class CustomTextFormField extends StatelessWidget {
  int lines;
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController control;
  CustomTextFormField(
      {super.key,
      required this.hintText,
      this.lines = 1,
      required this.validator,
      required this.control});

  @override
  Widget build(BuildContext context) {
    ThemeController controller = Get.find();

    return TextFormField(
      style: controller.appThem.textTheme.bodyMedium!
          .copyWith(color: AppColor.grey),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(getFontSize(screenWidth! * .06,
              screenWidth! * .06, screenWidth! * .035, screenWidth! * .035)),
          borderSide: const BorderSide(
            color: AppColor.blue,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(getFontSize(screenWidth! * .06,
              screenWidth! * .06, screenWidth! * .035, screenWidth! * .035)),
          borderSide: const BorderSide(
            color: AppColor.primary,
          ),
        ),
        focusColor: AppColor.primary,
        hintText: hintText,
        hintStyle: lines == 1
            ? controller.appThem.textTheme.bodySmall!
                .copyWith(color: AppColor.grey)
            : controller.appThem.textTheme.bodyMedium!
                .copyWith(color: AppColor.grey),
      ),
      minLines: lines,
      maxLines: lines,
      validator: validator,
      controller: control,
    );
  }
}
