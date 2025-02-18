class AppLinks {
  static const String adminLink = 'http://192.168.100.33:3030/V1/market';

  ////////////////////////Login //////////////////////////////////////////
  static const String loginLink = '$adminLink/login';

  ///////////////////////// Home //////////////////////////////////
  static const String getHomeData = '$adminLink/client/home';

  ///////////////////////// products //////////////////////////////////

  static const String getProducts = '$adminLink/client/products';

  static const String addProductToFavorite = '$adminLink/client/products/favorite';
  static const String deleteProductFromFavorite = '$adminLink/client/products/favorite';


  static const String deleteWorker = '$adminLink/client';
  static const String searchWorker = '$adminLink/clinet/search';
  static const String getWorkers = '$adminLink/clinet';
}
