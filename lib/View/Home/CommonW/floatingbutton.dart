import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:market_app/Core/app_color.dart';

class MyFloatingButton extends StatelessWidget {
  const MyFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient:
              LinearGradient(colors: [AppColor.darkBlue, AppColor.greencolor])),
      child: FloatingActionButton(
        onPressed: () {},
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
