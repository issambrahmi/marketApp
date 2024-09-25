import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_app/View/CardPage/commonW/card_products.dart';
import 'package:market_app/View/Order%20Detailes%20Page/commonW/order_detailes_down_sec.dart';
import 'package:market_app/View/Order%20Detailes%20Page/commonW/order_detailes_products.dart';
import 'package:market_app/View/Order%20Detailes%20Page/commonW/order_detailes_top_section.dart';

class OrderDetailesPage extends StatelessWidget {
  const OrderDetailesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const OrderDetailesTopSection(),
            SizedBox(height: 10.h),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const OrderDetailesProducts(),
            )),
            const OrderDetailesDownSec(),
          ],
        ),
      ),
    );
  }
}
