import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:market_app/View/SearchPage/commonW/search_form.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 15.w,
        ),
        child: const Column(
          children: [
            SearchFormProduct(),
            // GetBuilder<SearchDoctorController>(builder: (controller) {
            //   return const Expanded(child: ListOfDoctorsNames());
            // }),
          ],
        ),
      ),
    ));
  }
}
