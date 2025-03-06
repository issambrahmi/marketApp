import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:market_app/Controller/home_page_controller.dart';
import 'package:market_app/Core/Color/app_color.dart';
import 'package:market_app/Model/Enums/request_enum.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
        SizedBox(height: 10.h),
        Obx(() => Skeletonizer(
              enabled:
                  controller.categoriesReqState.value == RequestEnum.waiting
                      ? true
                      : false,
              child: SizedBox(
                height: 35.h,
                child: ListView.separated(
                  itemCount:
                      controller.categoriesReqState.value == RequestEnum.waiting
                          ? 5
                          : controller.categories.length + 1,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => SizedBox(width: 8.w),
                  itemBuilder: (context, index) {
                    if (controller.categoriesReqState.value ==
                        RequestEnum.waiting) {
                      return CCategorieCard(
                          catName: 'alllllllll', index: index);
                    } else {
                      if (index == 0) {
                        return const CCategorieCard(
                          catName: 'All',
                          index: 0,
                        );
                      } else {
                        return CCategorieCard(
                          catName: controller.categories[index - 1].name,
                          index: index,
                        );
                      }
                    }
                  },
                ),
              ),
            ))
      ],
    );
  }
}

class CCategorieCard extends StatelessWidget {
  const CCategorieCard({super.key, required this.catName, required this.index});

  final String catName;
  final int index;
  @override
  Widget build(BuildContext context) {
    HomePageController controller = Get.find<HomePageController>();
    return InkWell(
        onTap: () => controller.changeCategorie(index),
        child: Obx(
          () => Container(
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: controller.selectedCategorie.value == index
                  ? AppColor.primaryGradient
                  : AppColor.forthGradient,
            ),
            child: Center(
              child: Text(
                catName,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: controller.selectedCategorie.value == index
                      ? Colors.white
                      : Colors.black87,
                ),
              ),
            ),
          ),
        ));
  }
}
