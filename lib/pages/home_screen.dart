import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/constant.dart';
import 'package:todoapp/controllers/NoteController.dart';
import 'package:todoapp/controllers/note_text_field_controller.dart';
import 'package:todoapp/controllers/task_controller.dart';
import 'package:todoapp/controllers/task_text_field_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const MyFloationgActionsButton(),
      drawerEnableOpenDragGesture: false,
      drawer: const MyDrawer(),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: const [
                MyCustomAppBar(),
                SizedBox(
                  height: 70,
                ),
                PageTitle(),
                SizedBox(height: 100),
                TaskSection(),
                NoteSection(),
                ArchiveSection(),
              ],
            ),
            const BottonSection(),
          ],
        ),
      ),
    );
  }
}

class BottonSection extends StatelessWidget {
  const BottonSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 120,
                child: Column(
                  children: [
                    const CircleAvatar(
                      child: Icon(
                        Icons.task_rounded,
                        size: 42,
                      ),
                      backgroundColor: Colors.white,
                      radius: 40.0,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(() {
                      return Text(
                        Get.find<TaskController>()
                            .tasks
                            .where((p0) => p0.archive == false)
                            .length
                            .toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      );
                    }),
                  ],
                ),
              ),
              Container(
                width: 100,
                height: 120,
                child: Column(
                  children: [
                    const CircleAvatar(
                      child: Icon(
                        Icons.notes,
                        size: 42,
                      ),
                      backgroundColor: Colors.white,
                      radius: 40.0,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(() {
                      return Text(
                        Get.find<NoteController>()
                            .notes
                            .length
                            .toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      );
                    }),
                  ],
                ),
              ),
              Container(
                width: 100,
                height: 120,
                child: Column(
                  children: [
                    const CircleAvatar(
                      child: Icon(
                        Icons.archive,
                        size: 42,
                      ),
                      backgroundColor: Colors.white,
                      radius: 40.0,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(() {
                      return Text(
                        Get.find<TaskController>()
                            .tasks
                            .where((p0) => p0.archive == true)
                            .length
                            .toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 120,
                child: Column(
                  children: [
                    const CircleAvatar(
                      child: Icon(
                        Icons.list,
                        size: 42,
                      ),
                      backgroundColor: Colors.white,
                      radius: 40.0,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(() {
                      int count =
                          Get.find<TaskController>().tasks.length +
                              Get.find<NoteController>().notes.length;
                      return Text(
                        (count).toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      );
                    })
                  ],
                ),
              ),
            ],
          )
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
      width: Get.width,
      height: Get.height * 0.44,
      decoration: const BoxDecoration(
          color: kLightBlueColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25))),
    );
  }
}

class ArchiveSection extends StatelessWidget {
  const ArchiveSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          color: kLightBlueColor,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      width: Get.width,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: ListTile(
        trailing: Obx(() {
          return Container(
            margin: const EdgeInsets.only(right: 15),
            child: Text(
              Get.find<TaskController>()
                  .tasks
                  .where((p0) => p0.archive == true)
                  .length
                  .toString(),
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18),
            ),
          );
        }),
        leading: const Icon(Icons.archive),
        onTap: () {
          Get.toNamed('/archives');
        },
        title: const Text("Archives",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
    );
  }
}

class NoteSection extends StatelessWidget {
  const NoteSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          color: kLightBlueColor,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      width: Get.width,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: ListTile(
          leading: const Icon(Icons.note),
          onTap: () {
            Get.toNamed('notes');
          },
          title: const Text("Notes",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          trailing: IconButton(
            icon: const Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              Get.toNamed("/addnote");
            },
          )),
    );
  }
}

class TaskSection extends StatelessWidget {
  const TaskSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          color: kLightBlueColor,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      width: Get.width,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: ListTile(
          leading: const Icon(Icons.task),
          onTap: () {
            Get.toNamed('tasks');
          },
          title: const Text("Tasks",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          trailing: IconButton(
            icon: const Icon(
              Icons.add_task,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              Get.find<TaskTextFieldController>().title!.text = "";
              Get.find<TaskTextFieldController>().note!.text = "";
              Get.find<TaskTextFieldController>().label!.text = "";
              Get.find<TaskController>().isEditing.value = false;
              Get.toNamed("/addtask");
            },
          )),
    );
  }
}

class PageTitle extends StatelessWidget {
  const PageTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          "TODO Application",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}

class MyCustomAppBar extends StatelessWidget {
  const MyCustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: const Text(
              "",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
          ),
          Builder(
            builder: (context) => IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(Icons.menu),
            ),
          ),
        ],
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: SafeArea(
            child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            const CircleAvatar(
              radius: 50,
              child: Icon(
                Icons.person,
                size: 70,
              ),
            ),
            const SizedBox(height: 50),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: Get.width,
              child: ListTile(
                title: const Text('tasks'),
                trailing: const Icon(Icons.task),
                onTap: () {
                  Get.toNamed('/tasks');
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: Get.width,
              child: ListTile(
                title: const Text('notes'),
                trailing: const Icon(Icons.note),
                onTap: () {
                  Get.toNamed('/notes');
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: Get.width,
              child: ListTile(
                title: const Text('Click to exits'),
                trailing: Icon(Icons.close),
                onTap: () {
                  Get.defaultDialog(
                    title: 'Exit',
                    titleStyle: const TextStyle(color: Colors.redAccent),
                    middleText: 'Are you sure to exit?"',
                    middleTextStyle: const TextStyle(color: Colors.black45),
                    radius: 5,
                    barrierDismissible: false,
                    textCancel: 'Cancel',
                    cancelTextColor: Colors.black54,
                    onCancel: () {
                      // print('cancel');
                    },
                    textConfirm: 'Exit',
                    onConfirm: () {
                      exit(0);
                    },
                    confirmTextColor: Colors.redAccent,
                    buttonColor: Colors.greenAccent,
                  );
                },
              ),
            ),
          ],
        )),
      ),
    );
  }
}

class MyFloationgActionsButton extends StatelessWidget {
  const MyFloationgActionsButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.redAccent,
      child: const Icon(Icons.add),
      onPressed: () {
        Get.bottomSheet(
          Container(
              padding: const EdgeInsets.all(10),
              height: 200,
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      Get.find<TaskTextFieldController>().title!.text = "";
                      Get.find<TaskTextFieldController>().note!.text = "";
                      Get.find<TaskTextFieldController>().label!.text = "";
                      Get.find<TaskController>().isEditing.value = false;
                      Get.toNamed("/addtask");
                    },
                    title: const Text("add new task",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black45)),
                    leading: const Icon(
                      Icons.add_task,
                      size: 30,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Get.find<NoteTextFieldController>().text!.text = "";
                      Get.find<NoteTextFieldController>().label!.text = "";
                      Get.find<NoteController>().isEditing.value = false;
                      Get.toNamed("/addnote");
                    },
                    title: const Text("add new note",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black45)),
                    leading: const Icon(
                      Icons.note,
                      size: 30,
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }
}
