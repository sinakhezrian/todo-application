import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/constant.dart';
import 'package:todoapp/controllers/task_controller.dart';
import 'package:todoapp/controllers/task_text_field_controller.dart';

class ShowArchivesScreen extends StatelessWidget {
  const ShowArchivesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              color: kLightBlueColor,
              child: Column(
                children: [
                  Container(
                    width: Get.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: const Text(
                            "archive tasks",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w700),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    child: const Text(
                      "archive tasks",
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: 36,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Obx(() => ListView.separated(
                    itemBuilder: (context, index) {
                      var task = Get.find<TaskController>().tasks[index];
                      if (task.archive == true) {
                        return ListTile(
                          onLongPress: () => {
                            Get.find<TaskController>().tasks.removeAt(index),
                            Get.snackbar("Successfully", "task deleted",
                                backgroundColor: Colors.greenAccent)
                          },
                          title: Text(task.title ?? ''),
                          subtitle: Text(task.note ?? ''),
                          leading: Checkbox(
                            onChanged: (value) {
                              task.status = !task.status!;
                              Get.find<TaskController>().tasks[index] = task;
                            },
                            value: task.status,
                            activeColor: kLightBlueColor,
                            side: const BorderSide(
                                color: Colors.black54, width: 1.5),
                          ),
                          trailing: IconButton(
                              icon: const Icon(Icons.unarchive),
                              onPressed: () {
                                var taskk =
                                    Get.find<TaskController>().tasks[index];
                                taskk.archive = false;
                                Get.find<TaskController>().tasks[index] = taskk;
                                Get.defaultDialog(
                                    title: "Task unarchived",
                                    middleText: "task unarchived successfully");
                              }),
                          onTap: () {
                            Get.find<TaskTextFieldController>().title!.text =
                                Get.find<TaskController>().tasks[index].title!;
                            Get.find<TaskTextFieldController>().note!.text =
                                Get.find<TaskController>().tasks[index].note!;
                            Get.find<TaskTextFieldController>().label!.text =
                                Get.find<TaskController>().tasks[index].label!;
                            Get.find<TaskController>().isEditing.value = true;
                            Get.find<TaskController>().editIndex = index;
                            Get.toNamed('/addtask');
                          },
                        );
                      } else {
                        return Container();
                      }
                    },
                    separatorBuilder: (context, index) {
                      var task = Get.find<TaskController>().tasks[index];
                      if (task.archive == false) {
                        return const Divider(
                          color: Colors.black54,
                          height: 1,
                        );
                      } else {
                        return Container();
                      }
                    },
                    itemCount: Get.find<TaskController>().tasks.length,
                  )),
              width: Get.width,
              height: Get.height * 0.82,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
            ),
          ],
        ),
      ),
    );
  }
}
