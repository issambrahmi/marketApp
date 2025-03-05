import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_app/Core/Constantes/app_links.dart';
import 'package:market_app/Core/Services/hive_services.dart';
import 'package:market_app/Model/Models/order_model.dart';
import 'package:http/http.dart' as http;
import 'package:market_app/main.dart';

class CardController extends GetxController {
  RxList cardItems = [].obs;
  RxList editedItems = [].obs;
  RxBool isConfirmOrderLoading = false.obs;

  @override
  void onInit() {
    getCardProducts();
    super.onInit();
  }

  void getCardProducts() async {
    final data = await HiveServices.getCardProducts();
    for (var p in data) {
      cardItems.add(OrderItemModel.fromMap(p.cast<String, dynamic>()));
      update();
    }
  }

  void plusQnt(int index) {
    cardItems[index].qnt++;
    update();
  }

  void minusQnt(int index) {
    if (cardItems[index].qnt >= 2) cardItems[index].qnt--;
    update();
  }

  double calculateTotalPrice() {
    double price = 0;
    for (var i in cardItems) {
      price += i.qnt *
          (i.type == 'd'
              ? i.product.priceD
              : i.type == 'g'
                  ? i.product.priceG
                  : i.product.priceSG);
    }
    return price;
  }

  void addItemToEditedItems(int index) {
    if (!editedItems.contains(index)) {
      editedItems.add(index);
    }
  }

  void saveChanges() {
    for (var editedItem in editedItems) {
      HiveServices.editProductInCard(
          cardItems[editedItem].toJson(), editedItem);
    }
    editedItems.clear();
  }

  void confirmOrder() async {
    isConfirmOrderLoading.value = true;
    try {
      final response = await http.post(Uri.parse(AppLinks.addOrder),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            'orderData': {
              'client_id': userId,
              'total_price': calculateTotalPrice()
            },
            'items': cardItems
                .map((i) => {
                      'product_id': i.product.id,
                      'type': i.type,
                      'qnt': i.qnt,
                    })
                .toList()
          }));
      if (response.statusCode == 200) {
        HiveServices.clearCard();
        cardItems.clear();
        editedItems.clear();
        update();
      } else {
        throw Exception('error happen');
      }
      isConfirmOrderLoading.value = false;
    } catch (e) {
      debugPrint('** $e');
    }
  }
}
