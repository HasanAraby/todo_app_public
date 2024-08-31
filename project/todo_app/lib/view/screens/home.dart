import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/control/delete_all_controller.dart';
import 'package:todo_app/control/them_controller.dart';
import 'package:todo_app/core/constants/screen_size.dart';
import 'package:todo_app/view/screens/add_task.dart';
import 'package:todo_app/view/screens/arrange_tasks.dart';
import 'package:todo_app/view/widgets/custom-button.dart';
import 'package:todo_app/view/widgets/custom_loading.dart';
import 'tasks.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController controller = Get.find();
    DeleteAll cntrl = Get.put(DeleteAll());

    return GetBuilder<DeleteAll>(
      init: DeleteAll(),
      builder: (v) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Home',
          ),
        ),
        body: cntrl.loading
            ? const CustomLoading()
            : Center(
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                            onPressed: () {
                              Get.to(() => const Tasks());
                            },
                            text: 'Tasks'),
                        SizedBox(height: screenHeight! * .025),
                        CustomButton(
                            onPressed: () {
                              Get.to(() => const ArrangeTasks());
                            },
                            text: 'Arrange'),
                        SizedBox(height: screenHeight! * .025),
                        CustomButton(
                            onPressed: () {
                              Get.to(() => const AddTasks());
                            },
                            text: 'Add Task'),
                        SizedBox(height: screenHeight! * .025),
                        CustomButton(
                            onPressed: () async {
                              await cntrl.deleteTasks();
                            },
                            text: 'Delete All'),
                        SizedBox(height: screenHeight! * .025),
                        CustomButton(
                            onPressed: () async {
                              controller.changeMode();
                            },
                            text: 'Change Mode'),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
