import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:market_app/Controller/search_controller.dart';
import 'package:market_app/View/SearchPage/commonW/search_form.dart';
import 'package:market_app/View/SearchPage/commonW/searched_products.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SearchPageController());
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: Column(
              //controller: Get.find<SearchPageController>().searchedProductsScrollController,
              children: [
                SizedBox(height: 10.h),
                const SearchFormProduct(),
                SizedBox(height: 20.h),
                const Expanded(child: SearchedProducts())
              ],
            ),
          ),
        ));
  }
}
