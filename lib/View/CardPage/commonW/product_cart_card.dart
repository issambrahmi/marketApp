import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_app/Core/app_color.dart';

class ProductCartCard extends StatelessWidget {
  const ProductCartCard({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController qnt = TextEditingController();
    qnt.text = '1';
    return Container(
      height: 100.sp,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          Container(
            height: double.infinity,
            width: 80.sp,
            padding: EdgeInsets.all(5.sp),
            decoration: BoxDecoration(
                color: AppColor.mainScreencolor,
                borderRadius: BorderRadius.circular(15)),
            child: Image.asset(
              'assets/images/ifri.png',
              // width: 80.w,
            ),
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 80.w,
                child: Text(
                  'Boisson Ifri 1L ananas',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                '650 Da',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 30.sp,
                    width: 30.sp,
                    decoration: BoxDecoration(
                        color: AppColor.greencolor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Icon(
                        Icons.edit,
                        size: 18.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Container(
                    height: 30.sp,
                    width: 30.sp,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Icon(
                        Icons.delete,
                        size: 18.sp,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30.sp,
                child: Row(
                  children: [
                    Container(
                      height: 30.sp,
                      width: 30.sp,
                      decoration: BoxDecoration(
                          color: AppColor.mainScreencolor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Icon(
                          Icons.remove,
                          size: 18.sp,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    SizedBox(
                        height: 30.sp,
                        width: 30.sp,
                        child: TextField(
                          controller: qnt,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              fillColor: AppColor.mainScreencolor,
                              contentPadding: EdgeInsets.only(bottom: 10.h)
                              // filled: true
                              ),
                        )),
                    SizedBox(width: 8.w),
                    Container(
                      height: 30.sp,
                      width: 30.sp,
                      decoration: BoxDecoration(
                          color: AppColor.mainScreencolor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          size: 18.sp,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
