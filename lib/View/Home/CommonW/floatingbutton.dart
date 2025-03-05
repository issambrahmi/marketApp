import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:market_app/Core/Color/app_color.dart';
import 'package:market_app/View/CardPage/card_page.dart';

class AppFloatingButton extends StatelessWidget {
  const AppFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: AppColor.primaryGradient),
      child: FloatingActionButton(
        onPressed: () => Get.to(() => const CardPage()),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: SvgPicture.asset('assets/icons/cart.svg',
            height: 27.sp,
            width: 27.sp,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
      ),
    );
  }
}
