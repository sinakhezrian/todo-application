import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/constant.dart';
import 'package:todoapp/controllers/NoteController.dart';
import 'package:todoapp/controllers/note_text_field_controller.dart';
import 'package:todoapp/models/NoteModel.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(Get.find<NoteController>().isEditing.value ? "Edit" : "Add"),
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
                "write a note!",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            TextField(
              controller: Get.find<NoteTextFieldController>().text,
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
              controller: Get.find<NoteTextFieldController>().label,
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
                  if (Get.find<NoteController>().isEditing.value == true) {
                    int index = Get.find<NoteController>().editIndex;
                    var noet = Get.find<NoteController>().notes[index];
                    noet.text = Get.find<NoteTextFieldController>().text!.text;
                    noet.label =
                        Get.find<NoteTextFieldController>().label!.text;

                    Get.find<NoteController>().notes[index] = noet;
                  } else {
                    Get.find<NoteController>().notes.add(
                          NoteModel(
                              label: Get.find<NoteTextFieldController>()
                                  .label!
                                  .text,
                              text: Get.find<NoteTextFieldController>()
                                  .text!
                                  .text),
                        );
                  }
                  Get.back();
                },
                child: Text(Get.find<NoteController>().isEditing.value
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
