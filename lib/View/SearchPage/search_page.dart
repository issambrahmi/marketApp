import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_app/View/HomePage/commonW/random_product.dart';
import 'package:market_app/View/SearchPage/commonW/search_form.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: ListView(
              children: [
                const SearchFormProduct(),
                // GetBuilder<SearchDoctorController>(builder: (controller) {
                //   return const Expanded(child: ListOfDoctorsNames());
                // }),
                SizedBox(height: 10.h),
                const RandomProduct()
              ],
            ),
          ),
        ));
  }
}
