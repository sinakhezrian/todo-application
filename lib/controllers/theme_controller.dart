import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs;

  void toggle() {
    isDarkMode.value = !isDarkMode.value;
  }
}
