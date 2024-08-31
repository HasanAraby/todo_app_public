import 'package:get/get.dart';
import 'package:todo_app/core/functions/custom_snack_bar.dart';
import 'package:todo_app/model/data_base/db-helper.dart';

class DeleteAll extends GetxController {
  DbHelper db = DbHelper();
  bool loading = false;

  deleteTasks() async {
    loading = true;
    List? list = await db.readTasks();
    if (list!.isEmpty) {
      customSnackBar("You don't have any tasks!");
      loading = false;

      return;
    }
    int? ret = await db.deleteAll();
    loading = false;
    if (ret == 0) {
      customSnackBar("Can't delete now, try again!");
    } else {
      customSnackBar("All tasks have been deleted successfully!");
    }
  }
}
