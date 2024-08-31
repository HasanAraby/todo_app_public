import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/model/data_base/db-helper.dart';
import 'package:todo_app/view/screens/tasks.dart';
import 'package:todo_app/core/functions/custom_snack_bar.dart';

import '../model/data_base/task_model.dart';

class ReadDeleteEditController extends GetxController {
  late TextEditingController title;
  late TextEditingController body;
  late int id;
  late GlobalKey<FormState> formState;
  DbHelper db = DbHelper();
  bool loading = false;

  void setData(Map<String, dynamic> mp) {
    title.text = mp['title'];
    body.text = mp['body'];
    id = mp['id'];
  }

  save() async {
    if (formState.currentState!.validate()) {
      loading = true;
      update();
      Map<String, dynamic> tsk = {
        'id': id,
        'title': title.text,
        'body': body.text
      };

      int? ret = await db.updateTask(Task.fromMap(tsk));
      loading = false;
      update();
      Get.off(() => const Tasks());
      if (ret! > 0) {
        customSnackBar('Task has been Saved successfully!');
      } else {
        customSnackBar('Saving has failed, try again!');
      }
    }
  }

  delete() async {
    loading = true;
    update();
    int? ret = await db.deleteTask(id);
    loading = false;
    update();
    Get.off(() => const Tasks());
    if (ret! > 0) {
      customSnackBar('Task has been deleted successfully!');
    } else {
      customSnackBar('Deleting has failed, try again!');
    }
  }

  @override
  void onInit() {
    super.onInit();
    title = TextEditingController();
    body = TextEditingController();
    formState = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
    title.dispose();
    body.dispose();
  }
}
