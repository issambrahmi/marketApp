import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:market_app/Controller/home_controller.dart';
import 'package:market_app/Controller/search_controller.dart';
import 'package:market_app/Core/Color/app_color.dart';

class SearchFormProduct extends StatelessWidget {
  const SearchFormProduct({super.key});

  @override
  Widget build(BuildContext context) {
    SearchPageController controller = Get.find<SearchPageController>();
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 45.h,
            margin: EdgeInsets.symmetric(vertical: 8.h),
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: AppColor.secondGradient,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
                autofocus: true,
                controller: controller.search,
                cursorColor: AppColor.greencolor,
                // onFieldSubmitted: (str) => Get.to(
                //       () => const DoctorsResultPage(),
                //       transition: Transition.cupertino,
                //       duration: const Duration(milliseconds: 300),
                //     ),
                //onChanged: (txt) => controller.onChange(txt),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 10.h, left: 20.w),
                    filled: true,
                    fillColor: Colors.transparent,
                    hintText: 'Search for product',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none))),
          ),
        ),
        SizedBox(width: 10.w),
        GestureDetector(
          onTap: () {
            // FocusScope.of(context).unfocus();
            // showBottomSheetBar(context);
          },
          child: Container(
            height: 40.sp,
            width: 40.sp,
            padding: EdgeInsets.all(10.sp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: AppColor.thirdGradient,
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/filter.svg',
                width: double.infinity,
                height: double.infinity,
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
          ),
        ),
        SizedBox(width: 5.w),
      ],
    );
  }
}
