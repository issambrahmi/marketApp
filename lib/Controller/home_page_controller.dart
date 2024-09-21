import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  late TextEditingController search;

  @override
  void onInit() {
    search = TextEditingController();
    super.onInit();
  }
}
