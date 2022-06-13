import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteTextFieldController extends GetxController {
  TextEditingController? text;
  TextEditingController? label;

  @override
  void onInit() {
    text = TextEditingController();
    label = TextEditingController();
    super.onInit();
  }
}
