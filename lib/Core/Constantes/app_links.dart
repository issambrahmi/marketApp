class AppLinks {
  static const String adminLink = 'http://192.168.100.33:3030/V1/market/client';

  ////////////////////////Login //////////////////////////////////////////
  static const String loginLink = '$adminLink/login';

  ///////////////////////// Home //////////////////////////////////
  static const String getHomeData = '$adminLink/home';

  ///////////////////////// products //////////////////////////////////

  static const String getProducts = '$adminLink/products';
  static const String getCategorieProducts =
      '$adminLink/products/categorie';
  static const String addProductToFavorite = '$adminLink/products/favorite';
  static const String deleteProductFromFavorite =
      '$adminLink/products/favorite';

  /////////////////////////// orders ////////////////////////////
  static const String addOrder = '$adminLink/orders';
}
