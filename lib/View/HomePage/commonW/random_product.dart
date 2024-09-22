import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_app/View/HomePage/commonW/product_card.dart';

class RandomProduct extends StatelessWidget {
  const RandomProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20.w,
        mainAxisSpacing: 10.h,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        return const ProductCartHome();
      },
    );
  }
}
