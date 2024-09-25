import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_app/View/CardPage/commonW/product_cart_card.dart';

class CardProducts extends StatelessWidget {
  const CardProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      separatorBuilder: (context, index) =>  SizedBox(height: 8.h),
      itemBuilder: (BuildContext context, int index) {
        return const ProductCartCard();
      },
    );
  }
}
