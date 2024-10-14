import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late TextEditingController email;
  late TextEditingController password;
  late GlobalKey<FormState> key;
  RxBool isObsecure = true.obs;

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    key = GlobalKey<FormState>();
    super.onInit();
  }
}
