import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:market_app/Controller/home_controller.dart';
import 'package:market_app/Controller/search_controller.dart';
import 'package:market_app/Core/Color/app_color.dart';
import 'package:market_app/Core/Shared%20widgets/app_circle_indicator.dart';
import 'package:market_app/Model/Enums/request_enum.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchFormProduct extends StatelessWidget {
  const SearchFormProduct({super.key});

  @override
  Widget build(BuildContext context) {
    SearchPageController controller = Get.find<SearchPageController>();
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 45.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                decoration: BoxDecoration(
                  gradient: AppColor.secondGradient,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 10,
                      child: TextFormField(
                          autofocus: true,
                          controller: controller.search,
                          cursorColor: AppColor.greencolor,
                          onFieldSubmitted: (txt) =>
                              controller.searchForProducts(),
                          onChanged: (txt) {
                            controller.onSearchChange();
                          },
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(top: 10.h, left: 15.w),
                              filled: true,
                              fillColor: Colors.transparent,
                              hintText: 'Search for product',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none))),
                    ),
                    SizedBox(width: 3.w),
                    GetBuilder<SearchPageController>(
                        id: 'clear and check',
                        builder: (controller) {
                          if (controller.search.text.isNotEmpty) {
                            return Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: () => controller.clearSearch(),
                                  child: Icon(
                                    Icons.cancel_rounded,
                                    size: 22.sp,
                                    color: Colors.red,
                                  ),
                                ));
                          } else {
                            return const SizedBox();
                          }
                        })
                  ],
                ),
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
        ),
        // searched names
        SizedBox(height: 10.h),
        const NamesList()
      ],
    );
  }
}

class NamesList extends StatelessWidget {
  const NamesList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchPageController>(
        id: 'products names',
        builder: (controller) {
          return Obx(() => controller.isNamesShow.value
              ? controller.searchNamesReqState.value == RequestEnum.serverError
                  ? const Center(
                      child: Text('server err'),
                    )
                  : Skeletonizer(
                      enabled: controller.searchNamesReqState.value ==
                              RequestEnum.waiting
                          ? true
                          : false,
                      child: Container(
                        height: controller.names.length > 5
                            ? 180.h
                            : controller.names.length * 45.h,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          //color: AppColor.mainScreencolor,
                          gradient: AppColor.forthGradient,
                        ),
                        child: GetBuilder<SearchPageController>(
                            id: 'list of names',
                            builder: (controller) {
                              return ListView.separated(
                                  controller: controller.namesScrollController,
                                  itemCount: controller
                                              .searchNamesReqState.value ==
                                          RequestEnum.waiting
                                      ? 5
                                      : controller.isMaxSearchedNamesProducts ==
                                              true
                                          ? controller.names.length
                                          : controller.names.length + 1,
                                  separatorBuilder: (context, index) =>
                                      const Divider(
                                        color: Colors.white,
                                      ),
                                  itemBuilder: (context, index) {
                                    if (controller.isMaxSearchedNamesProducts ==
                                            false &&
                                        index == controller.names.length) {
                                      return AppCircleIndicator(size: 13.sp);
                                    }
                                    return InkWell(
                                      onTap: () =>
                                          controller.searchForProducts(),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15.w, vertical: 5.h),
                                        child: Text(
                                          controller.searchNamesReqState
                                                      .value ==
                                                  RequestEnum.waiting
                                              ? 'lllllllllllllllllllllllllllll'
                                              : controller.names[index]['name'],
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15.sp,
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            }),
                      ),
                    )
              : const SizedBox());
        });
  }
}
