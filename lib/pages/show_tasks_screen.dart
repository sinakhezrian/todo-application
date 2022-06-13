import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/constant.dart';
import 'package:todoapp/controllers/task_controller.dart';
import 'package:todoapp/controllers/task_text_field_controller.dart';

class ShowTasksScreen extends StatelessWidget {
  const ShowTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Get.find<TaskTextFieldController>().title!.text = "";
          Get.find<TaskTextFieldController>().note!.text = "";
          Get.find<TaskTextFieldController>().label!.text = "";
          Get.find<TaskController>().isEditing.value = false;
          Get.toNamed("/addtask");
        },
      ),
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
                            "tasks",
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
                      "Tasks",
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
                      if (task.archive == false) {
                        return ListTile(
                          onLongPress: () => {
                            Get.defaultDialog(
                              title: 'Delete task',
                              titleStyle: TextStyle(color: Colors.redAccent),
                              middleText: 'Are you sure to delete task?"',
                              middleTextStyle: TextStyle(color: Colors.black45),
                              radius: 5,
                              barrierDismissible: false,
                              textCancel: 'Cancel',
                              cancelTextColor: Colors.black54,
                              onCancel: () {
                                print('cancel');
                              },
                              textConfirm: 'Delete',
                              onConfirm: () {
                                Get.find<TaskController>().tasks.removeAt(index);
                                  Get.snackbar("Successfully", "task deleted",
                                backgroundColor: Colors.greenAccent);
                                Navigator.pop(context, false);
                                
                              },
                              confirmTextColor: Colors.redAccent,
                              buttonColor: Colors.greenAccent,
                            ),
                            
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
                              icon: const Icon(Icons.archive),
                              onPressed: () {
                                // print(index);

                                var taskk =
                                    Get.find<TaskController>().tasks[index];
                                taskk.archive = true;
                                Get.find<TaskController>().tasks[index] = taskk;
                                Get.defaultDialog(
                                    title: "Task Archived",
                                    middleText: "task archived successfully");
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
