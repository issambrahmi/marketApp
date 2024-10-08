import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_app/Core/app_color.dart';
import 'package:market_app/Shared%20widgets/product_qnt_dialogue.dart';

class ProductCartHome extends StatelessWidget {
  const ProductCartHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130.sp,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 110.h,
                width: 200.sp,
                padding: EdgeInsets.all(5.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.mainScreencolor.withOpacity(0.5),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/ifri.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 30.sp,
                  width: 30.sp,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    gradient: LinearGradient(
                        colors: [AppColor.darkBlue, AppColor.greencolor]),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.favorite_outline_rounded,
                      color: Colors.white,
                      size: 17.sp,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 5.h),
          Text(
            'ifri ananas',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.h),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '690 DA',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () => showAnimatedDialog(context , 'Add to cart'),
                  child: Container(
                    height: 28.sp,
                    width: 28.sp,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        border: Border.all(color: AppColor.greencolor)),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: AppColor.greencolor,
                        size: 20.sp,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
