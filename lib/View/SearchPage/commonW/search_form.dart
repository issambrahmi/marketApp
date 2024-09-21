import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:market_app/Core/app_color.dart';

class SearchFormProduct extends StatelessWidget {
  const SearchFormProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      width: double.infinity,
      child: TextFormField(
          autofocus: true,
          // onFieldSubmitted: (str) => Get.to(
          //       () => const DoctorsResultPage(),
          //       transition: Transition.cupertino,
          //       duration: const Duration(milliseconds: 300),
          //     ),
          //onChanged: (txt) => controller.onChange(txt),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 10.h, left: 20.w),
              filled: true,
              fillColor: AppColor.mainScreencolor,
              hintText: 'Search for a doctor',
              prefixIcon: GestureDetector(
                onTap: () => Get.back(),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              suffixIcon: SizedBox(
                height: 25.sp,
                width: 30.sp,
                child: GestureDetector(
                  onTap: () {
                    // FocusScope.of(context).unfocus();
                    // showBottomSheetBar(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                            colors: [AppColor.darkBlue, AppColor.greencolor])),
                    // child: SvgPicture.asset(
                    //   'assets/icons/design_icons/filter.svg',
                    //   width: 20.w,
                    //   colorFilter:
                    //       const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    // ),
                  ),
                ),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none))),
    );
  }
}
