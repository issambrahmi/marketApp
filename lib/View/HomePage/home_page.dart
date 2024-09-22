import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:market_app/Controller/add_product_controller.dart';
import 'package:market_app/Controller/home_page_controller.dart';
import 'package:market_app/View/HomePage/commonW/categories.dart';
import 'package:market_app/View/HomePage/commonW/home_page_search.dart';
import 'package:market_app/View/HomePage/commonW/home_text_form.dart';
import 'package:market_app/View/HomePage/commonW/most_popular_product.dart';
import 'package:market_app/View/HomePage/commonW/random_product.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageController controller = Get.put(HomePageController());
    Get.put(AddProductController());

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            SizedBox(height: 10.h),
            // HomePageTextFormFiled(
            //   hint: 'search',
            //   textController: controller.search,
            // ),
            const HomePageSearch(),
            SizedBox(height: 15.h),
            const HomePageCategories(),
            SizedBox(height: 20.h),
            const MostPopularProduct(),
            const Divider(),
            SizedBox(height: 20.h),
            const RandomProduct(),
          ],
        ),
      )),
    );
  }
}
