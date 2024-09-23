import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  String selectedPriceOption = 'Per Unit';
  
  int quanity = 1;
  late int totalPrice;
  late TextEditingController quantityController;

  @override
  void onInit() {
    quantityController = TextEditingController();
    quantityController.text = '1';
    super.onInit();
  }

  void plus() {
    quanity++;
    quantityController.text = quanity.toString();
  }

  void minus() {
    quanity--;
    quantityController.text = quanity.toString();
  }
}
