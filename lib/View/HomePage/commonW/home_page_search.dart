import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:market_app/Controller/home_controller.dart';
import 'package:market_app/Core/app_color.dart';

class HomePageSearch extends StatelessWidget {
  const HomePageSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.find<HomeController>().ontapIcon(1);
        Get.find<HomeController>().update();
      },
      child: Container(
        height: 50.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.mainScreencolor),
        child: Row(
          children: [
            Icon(
              Icons.search,
              size: 23.sp,
            ),
            SizedBox(width: 8.w),
            Text(
              'search',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
