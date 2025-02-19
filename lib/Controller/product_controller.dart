import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:market_app/Controller/home_page_controller.dart';
import 'package:market_app/Core/Constantes/app_links.dart';
import 'package:market_app/Core/Shared%20widgets/app_snackbar.dart';
import 'package:market_app/Model/Models/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:market_app/main.dart';

class ProductController extends GetxController {
  RxString selectedPriceOption = 'Per Unit'.obs;
  RxInt quanity = 1.obs;
  late int totalPrice;
  late TextEditingController quantityController;

  List<int> favoritesProducts = [];

  @override
  void onInit() {
    quantityController = TextEditingController();
    quantityController.text = '1';
    //getFavoriteProductsLocaly();
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

  void minus(ProductModel product) {
    if ((selectedPriceOption.value == 'Per Unit' && quanity > 1) ||
        (selectedPriceOption.value == 'Gros' && quanity > product.minQntG) ||
        (selectedPriceOption.value == 'Super Gros' &&
            quanity > product.minQntSG)) {
      quanity--;
      quantityController.text = quanity.toString();
    }
  }

  void addProductToFavorite(
      int productId, BuildContext context, int index) async {
    //
    AppSnackBar(context, 'product added to favorites');
    Get.find<HomePageController>().products[index].isFavorite!.value = true;

    try {
      final response = await http.post(Uri.parse(AppLinks.addProductToFavorite),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode({'clientId': userId, 'productId': productId}));
      if (response.statusCode == 200) {
        //HiveServices.addProuctToFavoriteLocaly(productId);
      } else {
        throw Exception();
      }
    } catch (e) {
      debugPrint('** $e');
      // ignore: use_build_context_synchronously
      AppSnackBar(context, 'product failed to add to favorites');
      Get.find<HomePageController>().products[index].isFavorite!.value = false;
    }
  }

  void deleteProductFromFavorite(
      int productId, BuildContext context, int index) async {
    //
    Get.find<HomePageController>().products[index].isFavorite.value = false;
    AppSnackBar(context, 'product delete from favorites');
    try {
      final response =
          await http.delete(Uri.parse(AppLinks.deleteProductFromFavorite),
              headers: {
                'Content-Type': 'application/json',
              },
              body: jsonEncode({'clientId': userId, 'productId': productId}));
      if (response.statusCode == 200) {
       // HiveServices.deleteProuctFromFavoriteLocaly(1);
      } else {
        throw Exception();
      }
    } catch (e) {
      debugPrint('** $e');
      // ignore: use_build_context_synchronously
      AppSnackBar(context, 'failed to delete from favorites');
      Get.find<HomePageController>().products[index].isFavorite!.value = true;
    }
  }

  // void getFavoriteProductsLocaly() async {
  //   try {
  //     favoritesProducts = await HiveServices.getProuctFavoritesProdctsLocaly();
  //     for (var element in favoritesProducts) {
  //       print(element);
  //     }

  //     Get.find<HomePageController>().products.map((product) {
  //       if (favoritesProducts.contains(product.id)) {
  //         product.isFavorite!.value = true;
  //       }
  //       print(product.isFavorite!.value);
  //       print('\n');
  //     });
  //   } catch (e) {
  //     debugPrint('** $e');
  //   }
  //}
}
