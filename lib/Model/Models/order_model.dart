import 'package:intl/intl.dart';
import 'package:market_app/Model/Models/product_model.dart';

class OrderModel {
  final int? id;
  final String clientName;
  String? workerName;
  final String date;
  final double totalePrice;
  final String status;
  final List<OrderItemModel> orderItems;

  OrderModel({
    this.id,
    required this.clientName,
    required this.workerName,
    required this.date,
    required this.totalePrice,
    required this.status,
    required this.orderItems,
  });

  factory OrderModel.fromMap(Map<String, dynamic> data) {
    String date =
        DateFormat('MMM d, h.mm a').format(DateTime.parse(data['date']));

    return OrderModel(
      id: data['id'],
      clientName: data['client_name'],
      workerName: data['worker_name'],
      date: date,
      orderItems: [],
      totalePrice: (data['total_price'] as num).toDouble(),
      status: data['status'],
    );
  }
}

class OrderItemModel {
  final int? id;
  //final int orderId;
  final ProductModel product;
  String type;
  int qnt;

  OrderItemModel({
    this.id,
    //required this.orderId,
    required this.product,
    required this.type,
    required this.qnt,
  });

  factory OrderItemModel.fromMap(Map<String, dynamic> data) {
    return OrderItemModel(
      id: data['id'],
      // orderId: data['order_id'],
      product: ProductModel.fromMap(data['product'].cast<String,dynamic>()),
      type: data['type'],
      qnt: data['qnt'],
    );
  }
}
