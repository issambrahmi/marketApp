import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:market_app/Controller/product_controller.dart';
import 'package:market_app/Controller/home_page_controller.dart';
import 'package:market_app/Core/Shared%20widgets/app_circle_indicator.dart';
import 'package:market_app/Model/Enums/request_enum.dart';
import 'package:market_app/View/HomePage/commonW/categories.dart';
import 'package:market_app/View/HomePage/commonW/home_page_search.dart';
import 'package:market_app/View/HomePage/commonW/random_product.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageController controller = Get.put(HomePageController());
    Get.put(ProductController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          controller: controller.scrollController,
          children: [
            SizedBox(height: 10.h),
            const HomePageSearch(),
            Obx(() => controller.reqState.value == RequestEnum.waiting
                ? SizedBox(
                    height: 400.h, child: AppCircleIndicator(size: 20.sp))
                : controller.reqState.value == RequestEnum.serverError
                    ? const Center(
                        child: Text('Server err'),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 20.h),
                          // const MostPopularProduct(),
                          // const Divider(),
                          const HomePageCategories(),
                          // SizedBox(height: 20.h),
                          SizedBox(height: 20.h),
                          Text(
                            'Products for you',
                            style: TextStyle(
                                fontSize: 17.sp, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 12.h),
                          const RandomProduct(),
                        ],
                      )),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      )),
    );
  }
}
