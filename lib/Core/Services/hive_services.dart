import 'package:hive/hive.dart';

class HiveServices {
  static changeIsLoginValue({required bool isLogin}) async {
    final loginBox = await Hive.openBox('isLogin');
    await loginBox.put('is_login', isLogin);
    await loginBox.close();
  }

  static Future<bool> getIsLoginValue() async {
    final loginBox = await Hive.openBox('isLogin');
    final isLogin = loginBox.get('is_login');
    await loginBox.close();
    return isLogin;
  }

  static saveUserData({required String token}) async {
    final userBox = await Hive.openBox('user_box');
    await userBox.put('user_data', token);
    await userBox.close();
  }

  static Future<String> getUserData() async {
    final userBox = await Hive.openBox('user_box');
    final userData = userBox.get('user_data');
    await userBox.close();
    return userData;
  }

  static clearUserData() async {
    final userBox = await Hive.openBox('user_box');
    await userBox.clear();
    await userBox.close();
  }

  ////////////////// favorite ///////////////////
  static addProuctToFavoriteLocaly(int productId) async {
    final productBox = await Hive.openBox('favorite_box');
    await productBox.add(productId);
    await productBox.close();
  }

  static deleteProuctFromFavoriteLocaly(int productId) async {
    final productBox = await Hive.openBox('favorite_box');
    productBox.delete(productId);
    await productBox.close();
  }

  static Future<List<int>> getProuctFavoritesProdctsLocaly() async {
    final productBox = await Hive.openBox('favorite_box');
    return productBox.values.cast<int>().toList();
  }
  ////////////////// favorite ///////////////////

  ////////////////// Card ///////////////////

  static void addProductToCard(Map product) async {
    final productBox = await Hive.openBox('card_products_box');
    await productBox.add(product);
    await productBox.close();
  }

  static void deleteProductFromCard(int index) async {
    final productBox = await Hive.openBox('card_products_box');

    productBox.deleteAt(index);
    await productBox.close();
  }

  static void editProductInCard(Map product, int index) async {
    final productBox = await Hive.openBox('card_products_box');
    await productBox.putAt(index, product);
    await productBox.close();
  }

  static Future<List<Map>> getCardProducts() async {
    final productBox = await Hive.openBox('card_products_box');
    List<Map> products = productBox.values.cast<Map>().toList();
    await productBox.close();
    return products;
  }

  static Future<bool> testIfProductExistInCard(int id) async {
    List<Map> products = await getCardProducts();
    List productsIds = products.map((p) => p['id']).toList();
    // final a = productsIds.contains(id);
    // print(a);
    return productsIds.contains(id);
  }

  static void clearCard() async {
    final productBox = await Hive.openBox('card_products_box');
    await productBox.clear();
    await productBox.close();
  }
}
