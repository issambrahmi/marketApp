import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_app/View/HomePage/commonW/product_card.dart';

class MostPopularProduct extends StatelessWidget {
  const MostPopularProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Most popular',
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.h),
         SizedBox(
          height: 190.h,
          child: ListView.separated(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 12.w),
            itemBuilder: (context, index) {
              return const ProductCartHome();
            },
          ),
        )
      ],
    );
  }
}
