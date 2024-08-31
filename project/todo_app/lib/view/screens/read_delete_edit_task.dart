import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/control/read_delete_edit_controller.dart';
import 'package:todo_app/core/constants/screen_size.dart';
import 'package:todo_app/core/functions/validate_input.dart';
import 'package:todo_app/view/screens/tasks.dart';
import 'package:todo_app/view/widgets/custom-button.dart';
import 'package:todo_app/view/widgets/custom_loading.dart';
import 'package:todo_app/view/widgets/custom_text_form_field.dart';

class ReadDeleteEditTask extends GetView<ReadDeleteEditController> {
  const ReadDeleteEditTask({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (did) {
        Get.off(() => const Tasks());
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Task'),
        ),
        body: controller.loading
            ? const CustomLoading()
            : Form(
                key: controller.formState,
                child: ListView(
                  padding: EdgeInsets.symmetric(
                      vertical: screenHeight! * .01,
                      horizontal: screenHeight! * .01),
                  children: [
                    CustomTextFormField(
                      hintText: 'Enter Task Title',
                      validator: (val) {
                        return validate('title', val!);
                      },
                      control: controller.title,
                    ),
                    SizedBox(height: screenHeight! * .025),
                    CustomTextFormField(
                      hintText: 'Enter Task Content',
                      lines: 8,
                      validator: (val) {
                        return validate('body', val!);
                      },
                      control: controller.body,
                    ),
                    SizedBox(height: screenHeight! * .04),
                    Column(
                      children: [
                        CustomButton(
                            onPressed: () async {
                              await controller.save();
                            },
                            text: 'Save'),
                        SizedBox(height: screenHeight! * .04),
                        CustomButton(
                            onPressed: () async {
                              await controller.delete();
                            },
                            text: 'Delete'),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
