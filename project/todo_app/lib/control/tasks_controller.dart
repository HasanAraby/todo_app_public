import 'package:get/get.dart';
import 'package:todo_app/control/read_delete_edit_controller.dart';
import 'package:todo_app/model/data_base/db-helper.dart';
import 'package:todo_app/view/screens/read_delete_edit_task.dart';

class TasksController extends GetxController {
  List? data;
  DbHelper db = DbHelper();
  bool loading = false;

  Future<List?> readData() async {
    loading = true;
    update();
    data = await db.readTasks();
    loading = false;
    update();
  }

  void onClick(Map<String, dynamic> mp) {
    ReadDeleteEditController controller =
        Get.put(ReadDeleteEditController(), permanent: true);
    controller.setData(mp);
    Get.off(() => const ReadDeleteEditTask());
  }

  @override
  void onInit() async {
    super.onInit();
    readData();
  }
}
