import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:market_app/Controller/home_controller.dart';
import 'package:market_app/Core/app_color.dart';

class MyBottomAppBar extends StatefulWidget {
  const MyBottomAppBar({super.key});

  @override
  State<MyBottomAppBar> createState() => _MyBottomAppBarState();
}

class _MyBottomAppBarState extends State<MyBottomAppBar>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppColor.mainScreencolor,
      elevation: 0,
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 0.w),
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      child: GetBuilder<HomeController>(
        builder: (controller) => TabBar(
            indicatorColor: AppColor.greencolor,
            controller: TabController(
                initialIndex: controller.currentIndex, length: 5, vsync: this),
            onTap: (index) => controller.ontapIcon(index),
            tabs: [
              Tab(
                icon: SvgPicture.asset('assets/icons/home.svg',
                    height: 25.h,
                    width: 25.w,
                    colorFilter: ColorFilter.mode(
                        controller.currentIndex == 0
                            ? AppColor.greencolor
                            : Colors.black54,
                        BlendMode.srcIn)),
              ),
              Tab(
                icon: SvgPicture.asset('assets/icons/search.svg',
                    height: 25.h,
                    width: 25.w,
                    colorFilter: ColorFilter.mode(
                        controller.currentIndex == 1
                            ? AppColor.greencolor
                            : Colors.black54,
                        BlendMode.srcIn)),
              ),
              SizedBox(width: 10.w),
              Tab(
                icon: SvgPicture.asset('assets/icons/favorite.svg',
                    height: 25.h,
                    width: 25.w,
                    colorFilter: ColorFilter.mode(
                        controller.currentIndex == 3
                            ? AppColor.greencolor
                            : Colors.black54,
                        BlendMode.srcIn)),
              ),
              Tab(
                icon: SvgPicture.asset('assets/icons/setting.svg',
                    height: 25.h,
                    width: 25.w,
                    colorFilter: ColorFilter.mode(
                        controller.currentIndex == 4
                            ? AppColor.greencolor
                            : Colors.black54,
                        BlendMode.srcIn)),
              ),
            ]),
      ),
    );
  }
}
