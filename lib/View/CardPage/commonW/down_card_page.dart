import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_app/Core/app_color.dart';
import 'package:market_app/Shared%20widgets/app_button.dart';

class DownCardPage extends StatelessWidget {
  const DownCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
     // height: 180.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              offset: Offset(0, -0.01),
              blurRadius: 1,
              color: Colors.black38,
              blurStyle: BlurStyle.solid)
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Totale : ',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '18000 Da',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            AppButton(
              text: 'Confirm order',
              height: 45.h,
              width: double.infinity,
              textSize: 17.sp,
              gradient: LinearGradient(
                colors: [AppColor.darkBlue, AppColor.greencolor],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
