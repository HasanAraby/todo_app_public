import 'package:get/get.dart';
import 'package:todo_app/core/functions/custom_snack_bar.dart';
import 'package:todo_app/model/data_base/db-helper.dart';
import 'package:todo_app/model/data_base/task_model.dart';

class ArrangeTasksController extends GetxController {
  List? data = [].obs;
  List? dynData = [].obs;
  DbHelper db = DbHelper();
  final loading = false.obs;
  reOrder(int lst, int nxt) {
    if (lst < nxt) {
      nxt--;
    }

    final item = dynData?.removeAt(lst);
    dynData?.insert(nxt, item);
    update();

  }

  save() async {
    if (dynData!.isEmpty) {
      Get.back();
      customSnackBar('Saved!');
      return;
    }

    loading.value = true;
    int? ret = await db.deleteAll();
    if (ret == 0) {
      loading.value = false;
      
      Get.back();
      customSnackBar("Can't re order now, try again!");
    }
    for (int i = 0; i < dynData!.length; ++i) {
      db.insertTask(Task(dynData![i]));
    }
    loading.value = false;

    Get.back();
    customSnackBar('Saved!');
  }

  readData() async {
    loading.value = true;
    data = await db.readTasks();
    dynData = List.from(data!);
    loading.value = false;
  }

  @override
  void onInit() async {
    super.onInit();
    readData();
  }
}
