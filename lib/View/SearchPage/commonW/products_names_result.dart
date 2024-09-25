import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ProductsNamesResult extends StatelessWidget {
  const ProductsNamesResult({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: Container(
            height: 45.h,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.transparent,
                border: Border(bottom: BorderSide(width: 0.5))),
            child: Row(
              children: [
                const Icon(
                  Icons.search,
                ),
                SizedBox(width: 10.w),
                Text(
                  'ifri',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
