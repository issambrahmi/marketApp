class AppLinks {
  static const String adminLink = 'http://192.168.100.33:3030/V1/market/client';

  ////////////////////////Login //////////////////////////////////////////
  static const String loginLink = '$adminLink/login';

  ///////////////////////// Categories //////////////////////////////////
  static const String getCategories = '$adminLink/categories';

  ///////////////////////// products //////////////////////////////////

  static const String getProducts = '$adminLink/products';
  static const String getCategorieProducts = '$adminLink/products/categorie';
  static const String addProductToFavorite = '$adminLink/products/favorite';
  static const String deleteProductFromFavorite =
      '$adminLink/products/favorite';
  static const String searchForProoducts = '$adminLink/products/search';
  static const String searchForProductsNames = '$adminLink/products/search/name';

  /////////////////////////// orders ////////////////////////////
  static const String addOrder = '$adminLink/orders';
}
