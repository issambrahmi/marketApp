import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:market_app/Core/app_color.dart';

class OrderDetailesTopSection extends StatelessWidget {
  const OrderDetailesTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration:  BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(offset: Offset(0, 1), color: AppColor.mainScreencolor, blurRadius: 10 ,)
      ]),
      child: Row(
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
          SizedBox(width: 60.w),
          Text(
            'Order Detailes',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
            ),
          ),
        ],
      ),
    );
  }
}
