import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:market_app/Core/Services/hive_services.dart';
import 'package:market_app/Model/Models/order_model.dart';

class CardController extends GetxController {
  List<OrderItemModel> cardItems = [];

  @override
  void onInit() {
    getCardProducts();
    super.onInit();
  }

  void getCardProducts() async {
    final data = await HiveServices.getCardProducts();
    for (var p in data) {
      cardItems.add(OrderItemModel.fromMap(p.cast<String, dynamic>()));
      update();
    }
  }

  void plusQnt(int index) {
    cardItems[index].qnt++;
    update();
  }

  void minusQnt(int index) {
    if (cardItems[index].qnt >= 2) cardItems[index].qnt--;
    update();
  }

  double calculateTotalPrice() {
    double price = 0;
    for (var i in cardItems) {
      price += i.qnt *
          (i.type == 'd'
              ? i.product.priceD
              : i.type == 'g'
                  ? i.product.priceG
                  : i.product.priceSG);
    }
    return price;
  }
}
