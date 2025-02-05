import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:market_app/Controller/home_page_controller.dart';
import 'package:market_app/Core/Shared%20widgets/app_circle_indicator.dart';
import 'package:market_app/View/HomePage/commonW/product_card.dart';

class RandomProduct extends StatelessWidget {
  const RandomProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(builder: (controller) {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.isMaxProducts
            ? controller.products.length
            : controller.products.length + 1,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20.w,
          mainAxisSpacing: 10.h,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          return !controller.isMaxProducts &&
                  index == controller.products.length
              ? AppCircleIndicator(size: 15.sp)
              : ProductCartHome(
                  product: controller.products[index],
                  index: index,
                );
        },
      );
    });
  }
}
