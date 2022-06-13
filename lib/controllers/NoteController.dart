import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todoapp/models/NoteModel.dart';

class NoteController extends GetxController {
  int editIndex = 0;
  RxBool isEditing = false.obs;
  RxList<NoteModel> notes = <NoteModel>[].obs;

  @override
  void onInit() {
    var box = GetStorage();
    if (box.read('notes') != null) {
      var list = box.read('notes');
      for (var item in list) {
        notes.add(NoteModel.formJson(item));
      }
    }
    ever(notes, (value) {
      box.write('notes', notes.toJson());
    });
    super.onInit();
  }
}
