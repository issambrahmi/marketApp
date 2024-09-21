import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_app/Core/app_color.dart';

class HomePageTextFormFiled extends StatelessWidget {
  const HomePageTextFormFiled({
    super.key,
    required this.hint,
    required this.textController,
  });
  final String hint;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: double.infinity,
      child: TextFormField(
        controller: textController,
        decoration: InputDecoration(
          // hintText: hint,
          // hintStyle: TextStyle(color: MyColors.greyColor.shade500),

          // contentPadding:
          //     EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
          fillColor: AppColor.mainScreencolor,
          filled: true,
          prefixIcon: Icon(
            Icons.search,
            size: 25.sp,
          ),
          labelText: hint,
          labelStyle: const TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 1.5, color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.black, width: 1.5)),
        ),
      ),
    );
  }
}
