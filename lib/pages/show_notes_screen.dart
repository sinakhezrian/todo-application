import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/constant.dart';
import 'package:todoapp/controllers/NoteController.dart';
import 'package:todoapp/controllers/note_text_field_controller.dart';
import 'package:todoapp/controllers/task_controller.dart';

class ShowNotesScreen extends StatelessWidget {
  const ShowNotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Get.find<NoteTextFieldController>().text!.text = "";
          Get.find<NoteTextFieldController>().label!.text = "";
          Get.find<NoteController>().isEditing.value = false;
          Get.toNamed("/addnote");
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
                            "notes",
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
                      "Notes",
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
                      var note = Get.find<NoteController>().notes[index];
                      return ListTile(
                        onLongPress: () => {
                          Get.defaultDialog(
                            title: 'Delete note',
                            titleStyle: TextStyle(color: Colors.redAccent),
                            middleText: 'Are you sure to delete note?"',
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
                              Get.find<NoteController>().notes.removeAt(index);
                              Get.snackbar("Successfully", "note deleted",
                                  backgroundColor: Colors.greenAccent);
                              Navigator.pop(context, false);
                            },
                            confirmTextColor: Colors.redAccent,
                            buttonColor: Colors.greenAccent,
                          ),
                        },
                        title: Text(note.text ?? ''),
                        subtitle: Text(note.label ?? ''),
                        onTap: () {
                          Get.find<NoteTextFieldController>().text!.text =
                              Get.find<NoteController>().notes[index].text!;

                          Get.find<NoteTextFieldController>().label!.text =
                              Get.find<NoteController>().notes[index].label!;

                          Get.find<NoteController>().isEditing.value = true;
                          Get.find<NoteController>().editIndex = index;
                          Get.toNamed('/addnote');
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        color: Colors.black54,
                        height: 1,
                      );
                    },
                    itemCount: Get.find<NoteController>().notes.length,
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
