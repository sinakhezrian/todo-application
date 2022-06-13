import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/constant.dart';
import 'package:todoapp/controllers/task_controller.dart';
import 'package:todoapp/controllers/task_text_field_controller.dart';
import 'package:todoapp/models/TaskModel.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(Get.find<TaskController>().isEditing.value ? "Edit" : "Add"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 50),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: Get.width,
              child: const Text(
                "what are you planning?",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            TextField(
              controller: Get.find<TaskTextFieldController>().title,
              maxLines: 6,
              cursorColor: kLightBlueColor,
              cursorHeight: 60,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
            ),
            TextField(
              controller: Get.find<TaskTextFieldController>().note,
              maxLength: 45,
              cursorColor: kLightBlueColor,
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  prefixIcon: const Icon(
                    Icons.bookmark_border,
                    color: Colors.black54,
                  ),
                  counter: Container(),
                  hintText: "Add note ..."),
            ),
            TextField(
              controller: Get.find<TaskTextFieldController>().label,
              maxLength: 45,
              cursorColor: kLightBlueColor,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: const Icon(
                    Icons.label,
                    color: Colors.black54,
                  ),
                  counter: Container(),
                  hintText: "Add label ..."),
            ),
            Container(
              width: Get.width,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(
                onPressed: () {
                  if (Get.find<TaskController>().isEditing.value == true) {
                    int index = Get.find<TaskController>().editIndex;
                    var task = Get.find<TaskController>().tasks[index];
                    task.title =
                        Get.find<TaskTextFieldController>().title!.text;
                    task.note = Get.find<TaskTextFieldController>().note!.text;
                    task.label =
                        Get.find<TaskTextFieldController>().label!.text;
                    Get.find<TaskController>().tasks[index] = task;
                  } else {
                    Get.find<TaskController>().tasks.add(
                          TaskModel(
                              title: Get.find<TaskTextFieldController>()
                                  .title!
                                  .text,
                              note: Get.find<TaskTextFieldController>()
                                  .note!
                                  .text,
                              status: false,
                              archive: false,
                              label: Get.find<TaskTextFieldController>()
                                  .label!
                                  .text),
                        );
                  }
                  Get.back();
                },
                child: Text(Get.find<TaskController>().isEditing.value
                    ? "Edit"
                    : "Add"),
                style: TextButton.styleFrom(
                    elevation: 0, backgroundColor: kLightBlueColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
