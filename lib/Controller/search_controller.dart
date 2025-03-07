import 'dart:async';
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
  List<Map<String, dynamic>> names = [];

  Rx<RequestEnum> searchReqState = RequestEnum.start.obs;
  Rx<RequestEnum> searchNamesReqState = RequestEnum.start.obs;
  bool isMaxSearchedProducts = false;
  bool isMaxSearchedNamesProducts = false;
  RxBool isNamesShow = false.obs;

  Timer? _debounce;
  late final ScrollController namesScrollController;
  late final ScrollController searchedProductsScrollController;

  @override
  void onInit() {
    search = TextEditingController();
    namesScrollController = ScrollController();
    searchedProductsScrollController = ScrollController();

    namesScrollController.addListener(() {
      if (namesScrollController.position.pixels >=
              namesScrollController.position.maxScrollExtent &&
          !isMaxSearchedNamesProducts) {
        loadMoreNames();
      }
    });

    searchedProductsScrollController.addListener(() {
      if (searchedProductsScrollController.position.pixels >=
          searchedProductsScrollController.position.maxScrollExtent) {
        loadMoreSearchedProducts();
      }
    });

    super.onInit();
  }

  @override
  void onClose() {
    search.dispose();
    namesScrollController.dispose();
    searchedProductsScrollController.dispose();
    _debounce?.cancel();
    super.onClose();
  }

  void clearSearch() {
    search.clear();
    onSearchChange();
  }

  void onSearchChange() {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }

    _debounce = Timer(const Duration(milliseconds: 500), () {
      names.clear();
      update(['clear and check']);
      if (search.text.trim().isEmpty && isNamesShow.value == true) {
        isNamesShow.value = false;
      } else if (search.text.trim().isNotEmpty && isNamesShow.value == false) {
        isNamesShow.value = true;
      }
      if (search.text.trim().isNotEmpty) {
        searchByName();
      }
    });
  }

  void searchForProducts({int? index}) async {
    searchedProducts.clear();
    isNamesShow.value = false;
    isMaxSearchedProducts = false;
    _debounce?.cancel();
    searchReqState.value = RequestEnum.waiting;
    try {
      final response = await http.get(Uri.parse(
          '${AppLinks.searchForProoducts}/${index == null ? search.text.trim() : names[index]['name']}/0'));
      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body)['products'];

        searchedProducts.assignAll(
            data.map<ProductModel>((p) => ProductModel.fromMap(p)).toList());

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
    update(['searched products']);
  }

  void searchByName() async {
    searchNamesReqState.value = RequestEnum.waiting;
    try {
      final response = await http.get(Uri.parse(
          '${AppLinks.searchForProductsNames}/${search.text.trim()}/0'));
      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body)['productsNames'];

        names.assignAll(data.map((p) => {
              'id': p['id'],
              'name': p['name'],
            }));

        if (data.length < 30) {
          isMaxSearchedNamesProducts = true;
        }
        searchNamesReqState.value = RequestEnum.successes;
      } else {
        throw Exception('else err : ${jsonDecode(response.body)['message']} ');
      }
    } catch (e) {
      debugPrint('** $e');
      searchNamesReqState.value = RequestEnum.serverError;
    }
    update(['products names']);
  }

  void loadMoreNames() async {
    try {
      final response = await http.get(Uri.parse(
          '${AppLinks.searchForProductsNames}/${search.text.trim()}/${names.length}'));
      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body)['productsNames'];

        for (var p in data) {
          names.add({
            'id': p['id'],
            'name': p['name'],
          });
        }
        if (data.length < 30) {
          isMaxSearchedNamesProducts = true;
        }
      } else {
        throw Exception('else err : ${jsonDecode(response.body)['message']} ');
      }
    } catch (e) {
      debugPrint('** $e');
    }
    update(['list of names']);
  }

  void loadMoreSearchedProducts() async {
    try {
      final response = await http.get(Uri.parse(
          '${AppLinks.searchForProoducts}/${search.text.trim()}/${searchedProducts.length}'));
      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body)['products'];

        for (var p in data) {
          searchedProducts.add(ProductModel.fromMap(p));
        }
        print(searchedProducts.length);
        if (data.length < 30) {
          isMaxSearchedProducts = true;
        }
      } else {
        throw Exception('else err : ${jsonDecode(response.body)['message']} ');
      }
    } catch (e) {
      debugPrint('** $e');
    }
    update(['searched products']);
  }
}
