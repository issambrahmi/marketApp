import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:market_app/Controller/product_controller.dart';
import 'package:market_app/Core/Constantes/app_links.dart';
import 'package:market_app/Model/Enums/request_enum.dart';
import 'package:market_app/Model/Models/categorie_model.dart';
import 'package:market_app/Model/Models/product_model.dart';

class HomePageController extends GetxController {
  late TextEditingController search;

  List<CategorieModel> categories = [];
  List<ProductModel> products = [];

  final ScrollController scrollController = ScrollController();
  Rx<RequestEnum> reqState = RequestEnum.start.obs;
  bool isMaxProducts = false;

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    //////////////////////////
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        if (!isMaxProducts) {
          loadMoreProducts();
        }
      }
    });
    ////////////////////////
    super.onInit();
  }

  @override
  void onClose() {
    search.dispose();
    super.onClose();
  }

  void getData() async {
    reqState.value = RequestEnum.waiting;
    try {
      final response = await http.get(Uri.parse(AppLinks.getHomeData));
      if (response.statusCode == 200) {
        final Map data = jsonDecode(response.body)['data'];

        categories.assignAll(data['categories']
            .map<CategorieModel>((cat) => CategorieModel.fromMap(cat))
            .toList());

        products.assignAll(data['products']
            .map<ProductModel>((product) => ProductModel.fromMap(product))
            .toList());

        reqState.value = RequestEnum.successes;
      } else {
        reqState.value = RequestEnum.serverError;
      }
    } catch (e) {
      debugPrint('** $e');
      reqState.value = RequestEnum.serverError;
    }
  }

  void loadMoreProducts() async {
    try {
      final response = await http
          .get(Uri.parse('${AppLinks.getProducts}/${products.length}'));
      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body)['products'];
        if (data.length < 30) {
          isMaxProducts = true;
        }

        for (var product in data) {
          products.add(ProductModel.fromMap(product));
        }
        update();
      }
    } catch (e) {
      debugPrint('** $e');
    }
  }
}
