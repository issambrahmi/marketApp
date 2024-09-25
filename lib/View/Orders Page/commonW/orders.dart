import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_app/Core/app_color.dart';
import 'package:market_app/View/Orders%20Page/commonW/order_card.dart';
import 'package:market_app/main.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => SizedBox(height: 8.h),
        itemBuilder: (BuildContext context, int index) {
          return const OrderCard();
        },
      ),
    );
  }
}
