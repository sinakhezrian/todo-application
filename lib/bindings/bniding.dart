import 'package:get/get.dart';
import 'package:todoapp/controllers/NoteController.dart';
import 'package:todoapp/controllers/note_text_field_controller.dart';
import 'package:todoapp/controllers/task_controller.dart';
import 'package:todoapp/controllers/task_text_field_controller.dart';
import 'package:todoapp/controllers/theme_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(TaskController());
    Get.put(TaskTextFieldController());
    Get.put(ThemeController());
    Get.put(NoteController());
    Get.put(NoteTextFieldController());
  }
}
