import 'package:get/get.dart';
import 'package:market_app/Model/Enums/order_page_enum.dart';

class OrderPageController extends GetxController {
  OrderPageEnum cartState = OrderPageEnum.orders;
  void onChangecarttState(OrderPageEnum state) {
    cartState = state;
    print(cartState);
    update();
  }
}
