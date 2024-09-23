import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_app/View/CardPage/commonW/product_cart_card.dart';
import 'package:market_app/View/HomePage/commonW/product_card.dart';

class CardProducts extends StatelessWidget {
  const CardProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      separatorBuilder: (context, index) =>  SizedBox(height: 12.h),
      itemBuilder: (BuildContext context, int index) {
        return const ProductCartCard();
      },
    );
  }
}
