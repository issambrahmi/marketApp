import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:market_app/Controller/home_page_controller.dart';
import 'package:market_app/Core/Color/app_color.dart';

class HomePageCategories extends StatelessWidget {
  const HomePageCategories({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageController controller = Get.find<HomePageController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categories',
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12.h),
        SizedBox(
          height: 35.h,
          child: ListView.separated(
            itemCount: controller.categories.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 8.w),
            itemBuilder: (context, index) {
              return CCategorieCard(
                catName: controller.categories[index].name,
              );
            },
          ),
        )
      ],
    );
  }
}

class CCategorieCard extends StatelessWidget {
  const CCategorieCard({super.key, required this.catName});

  final String catName;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        padding: EdgeInsets.all(8.sp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(colors: [
              AppColor.darkBlue,
              AppColor.greencolor,
            ])
            // color: AppColor.mainScreencolor,
            ),
        child: Text(
          catName,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
    //  Column(
    //   children: [
    //     Container(
    //       height: 60.h,
    //       width: 60.h,
    //       padding: EdgeInsets.all(4.sp),
    //       decoration: BoxDecoration(
    //         color: AppColor.greencolor.withOpacity(0.3),
    //         borderRadius: BorderRadius.circular(10),
    //       ),
    //       child: Center(
    //         child: Image.asset('assets/images/fruit.jpg'),
    //       ),
    //     ),
    //     const Text('fruit')
    //   ],
    // );
  }
}
