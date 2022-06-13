import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todoapp/models/TaskModel.dart';

class TaskController extends GetxController {
  int editIndex = 0;
  RxBool isEditing = false.obs;
  RxList<TaskModel> tasks = <TaskModel>[].obs;

 @override
  void onInit() {
    var box = GetStorage();

    if (box.read('taskss') != null) {
      var list = box.read('taskss');
      for (var item in list) {
        tasks.add(TaskModel.formJson(item));
      }
    }

    ever(tasks, (value) {
      box.write('taskss', tasks.toJson());
    });

    super.onInit();
  }
}
