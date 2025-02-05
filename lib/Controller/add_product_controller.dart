import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  RxString selectedPriceOption = 'Per Unit'.obs;
  RxInt quanity = 1.obs;
  late int totalPrice;
  late TextEditingController quantityController;

  @override
  void onInit() {
    quantityController = TextEditingController();
    quantityController.text = '1';
    super.onInit();
  }

  void resetData() {
    quanity.value = 1;
    selectedPriceOption.value = 'Per Unit';
    quantityController.text = '1';
  }

  void plus() {
    quanity++;
    quantityController.text = quanity.toString();
  }

  void minus() {
    if (quanity > 1) {
      quanity--;
      quantityController.text = quanity.toString();
    }
  }
}
