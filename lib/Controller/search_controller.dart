import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:market_app/Core/Constantes/app_links.dart';
import 'package:market_app/Model/Enums/request_enum.dart';
import 'package:market_app/Model/Models/product_model.dart';

class SearchPageController extends GetxController {
  late TextEditingController search;
  List<ProductModel> searchedProducts = [];

  Rx<RequestEnum> searchReqState = RequestEnum.start.obs;
  bool isMaxSearchedProducts = false;

  @override
  void onInit() {
    search = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    search.dispose();
    super.onClose();
  }

  void searchForProducts() async {
    searchReqState.value = RequestEnum.waiting;
    try {
      final response = await http.get(Uri.parse(AppLinks.getCategories));
      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body)['products'];

        searchedProducts.assignAll(data
            .map<ProductModel>((p) => ProductModel.fromMap(p))
            .toList());

        if (data.length < 30) {
          isMaxSearchedProducts = true;
        }

        searchReqState.value = RequestEnum.successes;
      } else {
        searchReqState.value = RequestEnum.serverError;
      }
    } catch (e) {
      debugPrint('** $e');
      searchReqState.value = RequestEnum.serverError;
    }
  }
}
