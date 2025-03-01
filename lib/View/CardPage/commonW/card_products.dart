import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:market_app/Controller/card_controller.dart';
import 'package:market_app/View/CardPage/commonW/product_cart_card.dart';

class CardProducts extends StatelessWidget {
  const CardProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CardController>(builder: (controller) {
      return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller.cardItems.length,
        separatorBuilder: (context, index) => SizedBox(height: 8.h),
        itemBuilder: (BuildContext context, int index) {
          return OrderItemCard(
            item: controller.cardItems[index],
            index: index,
          );
        },
      );
    });
  }
}
