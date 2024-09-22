import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_app/Core/app_color.dart';

class HomePageCategories extends StatelessWidget {
  const HomePageCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categories',
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.h),
        SizedBox(
          height: 35.h,
          child: ListView.separated(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 8.w),
            itemBuilder: (context, index) {
              return const CCategorieCard();
            },
          ),
        )
      ],
    );
  }
}

class CCategorieCard extends StatelessWidget {
  const CCategorieCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColor.mainScreencolor,
      ),
      child: Text(
        'Boisson',
        style: TextStyle(fontSize: 14.sp),
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
