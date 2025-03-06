import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:market_app/Core/Constantes/app_links.dart';
import 'package:market_app/Model/Enums/request_enum.dart';
import 'package:market_app/Model/Models/categorie_model.dart';
import 'package:market_app/Model/Models/product_model.dart';

class HomePageController extends GetxController {
  final ScrollController scrollController = ScrollController();

  List<CategorieModel> categories = [];
  List<ProductModel> products = [];
  RxList categorieProducts = [].obs;

  Rx<RequestEnum> productsReqState = RequestEnum.start.obs;
  Rx<RequestEnum> categoriesReqState = RequestEnum.start.obs;
  Rx<RequestEnum> categorieProductsReqState = RequestEnum.start.obs;
  bool isMaxProducts = false;
  bool isMaxCategorieProducts = false;

  RxInt selectedCategorie = 0.obs;

  @override
  void onInit() {
    getCategories();
    getProducts();
    //////////////////////////
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        if (selectedCategorie.value == 0 && !isMaxProducts) {
          loadMoreProducts();
        }
        if (selectedCategorie.value != 0 && !isMaxCategorieProducts) {
          loadMoreCategorieProducts();
        }
      }
    });
    ////////////////////////
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void changeCategorie(int index) {
    if (index != selectedCategorie.value) {
      selectedCategorie.value = index;
      if (index != 0) {
        getCategorieProducts();
      }
      update();
    }
  }

  void getCategories() async {
    categoriesReqState.value = RequestEnum.waiting;
    try {
      final response = await http.get(Uri.parse(AppLinks.getCategories));
      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body)['categories'];

        categories.assignAll(data
            .map<CategorieModel>((cat) => CategorieModel.fromMap(cat))
            .toList());

        categoriesReqState.value = RequestEnum.successes;
      } else {
        categoriesReqState.value = RequestEnum.serverError;
      }
    } catch (e) {
      debugPrint('** $e');
      categoriesReqState.value = RequestEnum.serverError;
    }
  }

  void getProducts() async {
    productsReqState.value = RequestEnum.waiting;
    try {
      final response = await http.get(Uri.parse('${AppLinks.getProducts}/0'));
      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body)['products'];

        products.assignAll(data
            .map<ProductModel>((cat) => ProductModel.fromMap(cat))
            .toList());

        productsReqState.value = RequestEnum.successes;
      } else {
        productsReqState.value = RequestEnum.serverError;
      }
    } catch (e) {
      debugPrint('** $e');
      productsReqState.value = RequestEnum.serverError;
    }
  }

  void getCategorieProducts() async {
    productsReqState.value = RequestEnum.waiting;
    try {
      final response = await http.get(Uri.parse(
          '${AppLinks.getCategorieProducts}/${categories[selectedCategorie.value - 1].id}/0'));
      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body)['products'];
        categorieProducts.assignAll(
            data.map<ProductModel>((p) => ProductModel.fromMap(p)).toList());

        if (data.length < 30) {
          isMaxCategorieProducts = true;
        }
        productsReqState.value = RequestEnum.successes;
      } else {
        throw Exception(jsonDecode(response.body)['message']);
      }
    } catch (e) {
      debugPrint('** $e');
      productsReqState.value = RequestEnum.serverError;
      selectedCategorie.value = 0;
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

  void loadMoreCategorieProducts() async {
    try {
      final response = await http.get(Uri.parse(
          '${AppLinks.getCategorieProducts}/${categorieProducts.length}'));
      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body)['products'];
        for (var product in data) {
          products.add(ProductModel.fromMap(product));
        }
        if (data.length < 30) {
          isMaxCategorieProducts = true;
        }
        update();
      }
    } catch (e) {
      debugPrint('** $e');
    }
  }
}
