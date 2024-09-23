import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:market_app/Controller/order_page_controller.dart';
import 'package:market_app/Core/app_color.dart';
import 'package:market_app/Model/Enums/order_page_enum.dart';

class TopSectionOrderpage extends StatelessWidget {
  const TopSectionOrderpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: GetBuilder<OrderPageController>(builder: (controller) {
        return Stack(
          alignment: Alignment.center,
          children: [
            AnimatedAlign(
              duration: const Duration(milliseconds: 300),
              alignment: controller.cartState == OrderPageEnum.orders
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: Container(
                height: double.infinity,
                width: 120.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(colors: [
                      AppColor.darkBlue.withOpacity(0.8),
                      AppColor.greencolor.withOpacity(
                        0.8,
                      )
                    ])),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () =>
                        controller.onChangecarttState(OrderPageEnum.orders),
                    child: Container(
                      height: double.infinity,
                      width: 80.w,
                      color: Colors.transparent,
                      child: Center(
                        child: Text(
                          'Orders',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                              color:
                                  controller.cartState == OrderPageEnum.orders
                                      ? Colors.white
                                      : Colors.black),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () =>
                        controller.onChangecarttState(OrderPageEnum.history),
                    child: Container(
                      height: double.infinity,
                      width: 80.w,
                      color: Colors.transparent,
                      child: Center(
                        child: Text(
                          'History',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                              color:
                                  controller.cartState == OrderPageEnum.history
                                      ? Colors.white
                                      : Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
