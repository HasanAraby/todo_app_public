import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/color.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
      color: AppColor.primary,
    ));
  }
}
