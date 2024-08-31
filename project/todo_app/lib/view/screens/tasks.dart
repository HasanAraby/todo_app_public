import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/control/tasks_controller.dart';
import 'package:todo_app/core/constants/app_theme.dart';
import 'package:todo_app/core/constants/color.dart';
import 'package:todo_app/view/widgets/custom_listTile.dart';
import 'package:todo_app/view/widgets/custom_loading.dart';

class Tasks extends StatelessWidget {
  const Tasks({super.key});

  @override
  Widget build(BuildContext context) {
    TasksController controller = Get.put(TasksController());
    return GetBuilder(
      init: TasksController(),
      builder: (val) => Scaffold(
        appBar: AppBar(
          title: const Text('Tasks'),
        ),
        body: controller.loading
            ? const CustomLoading()
            : controller.data!.isEmpty
                ? Center(
                    child: Text(
                      'No Tasks Found!',
                      style: lightMode.textTheme.bodyMedium!
                          .copyWith(color: AppColor.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: controller.data!.length,
                    itemBuilder: (BuildContext context, int index) => InkWell(
                      onTap: () {
                        controller.onClick(controller.data![index]);
                      },
                      child: CustomListTile(
                        tit: controller.data![index]['title'],
                        subTit: controller.data![index]['body'],
                      ),
                    ),
                  ),
      ),
    );
  }
}
