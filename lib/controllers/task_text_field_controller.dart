import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskTextFieldController extends GetxController {
  TextEditingController? title;
  TextEditingController? note;
  TextEditingController? label;

  @override
  void onInit() {
    title = TextEditingController();
    note = TextEditingController();
    label = TextEditingController();
    super.onInit();
  }
}
