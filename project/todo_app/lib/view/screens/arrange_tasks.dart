import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/control/arrange_tasks_controller.dart';
import 'package:todo_app/core/constants/app_theme.dart';
import 'package:todo_app/core/constants/color.dart';
import 'package:todo_app/core/constants/screen_size.dart';
import 'package:todo_app/core/functions/font_size.dart';
import 'package:todo_app/view/widgets/custom_listTile.dart';
import 'package:todo_app/view/widgets/custom_loading.dart';

class ArrangeTasks extends StatelessWidget {
  const ArrangeTasks({super.key});

  @override
  Widget build(BuildContext context) {
    ArrangeTasksController controller = Get.put(ArrangeTasksController());

    return GetBuilder<ArrangeTasksController>(
        init: ArrangeTasksController(),
        builder: (controll) => Obx(() => Scaffold(
            appBar: AppBar(
              title: const Text('Arrange Tasks'),
            ),
            floatingActionButton: Container(
              height: getFontSize(screenWidth! * .16, screenWidth! * .16,
                  screenWidth! * .12, screenWidth! * .12),
              width: getFontSize(screenWidth! * .16, screenWidth! * .16,
                  screenWidth! * .12, screenWidth! * .12),
              child: FloatingActionButton(
                onPressed: () async {
                  await controller.save();
                },
                backgroundColor: AppColor.green,
                child: Text(
                  'Save',
                  style: darkMode.textTheme.bodySmall,
                ),
              ),
            ),
            body: controller.loading.value == true
                ? const CustomLoading()
                : controller.dynData!.isEmpty
                    ? Center(
                        child: Text(
                          'No Tasks Found!',
                          style: lightMode.textTheme.bodyMedium!
                              .copyWith(color: AppColor.grey),
                        ),
                      )
                    : ReorderableListView(
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        onReorder: (oldIndex, newIndex) {
                          controller.reOrder(oldIndex, newIndex);
                        },
                        children: [
                          for (final item in controller.dynData!)
                            CustomListTile(
                                key: ValueKey(item),
                                tit: item['title'],
                                subTit: item['body']),
                        ],
                      ))));
  }
}
