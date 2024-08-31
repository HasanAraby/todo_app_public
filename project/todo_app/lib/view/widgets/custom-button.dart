import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:todo_app/core/constants/app_theme.dart';
import 'package:todo_app/core/constants/color.dart';
import 'package:todo_app/core/constants/screen_size.dart';
import 'package:todo_app/core/functions/initiate_screen_size.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String? text;

  const CustomButton({super.key, required this.onPressed, required this.text});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: getValueForScreenType<double>(
            context: context,
            mobile: isPortrait(
                MediaQuery.of(context), screenWidth! * .1, screenWidth! * .5),
            tablet: isPortrait(
                MediaQuery.of(context), screenWidth! * .2, screenWidth! * .4),
          ),
        ),
        height: screenHeight! * .06,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(screenHeight! * .025),
          color: AppColor.primary,
        ),
        child: Center(
          child: Text(
            text!,
            style: lightMode.textTheme.bodyMedium!.copyWith(
              color: AppColor.white,
            ),
          ),
        ),
      ),
    );
  }
}
