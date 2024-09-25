import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:market_app/Core/app_color.dart';

class CardTopSect extends StatelessWidget {
  const CardTopSect({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          offset: const Offset(0, 2),
          color: AppColor.mainScreencolor,
          blurRadius: 10,
        )
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              style: IconButton.styleFrom(
                backgroundColor: AppColor.mainScreencolor,
              ),
              icon: const Icon(
                Icons.arrow_back_ios_new,
              )),
          Text(
            'My Cart',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22.sp,
            ),
          ),
          Container(
            height: 25.h,
            width: 80.w,
            decoration: BoxDecoration(
              color: AppColor.deleteColor,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                'clear',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
