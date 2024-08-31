import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/model/data_base/db-helper.dart';
import 'package:todo_app/model/data_base/task_model.dart';

import '../core/functions/custom_snack_bar.dart';

class AddTaskController extends GetxController {
  late TextEditingController title;
  late TextEditingController body;
  late GlobalKey<FormState> formState;
  DbHelper db = DbHelper();
  bool loading = false;

  addTask() async {
    //valid then add
    if (formState.currentState!.validate()) {
      Task task = Task({'title': title.text, 'body': body.text});
      loading = true;
      update();
      int? ret = await db.insertTask(task);
      loading = false;
      update();
      Get.back();
      if (ret! > 0) {
        customSnackBar('Task has been added successfully!');
      } else {
        customSnackBar('Adding has failed, try again!');
      }
    }
  }

  @override
  void onInit() {
    title = TextEditingController();
    body = TextEditingController();
    formState = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  void dispose() {
    title.dispose();
    body.dispose();
    super.dispose();
  }
}
