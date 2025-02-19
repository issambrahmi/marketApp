import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:market_app/Controller/product_controller.dart';
import 'package:market_app/Core/Color/app_color.dart';
import 'package:market_app/Core/Shared%20widgets/product_qnt_dialogue.dart';
import 'package:market_app/Model/Models/product_model.dart';

class ProductCartHome extends StatelessWidget {
  const ProductCartHome(
      {super.key, required this.product, required this.index});

  final ProductModel product;
  final int index;
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
                child: InkWell(
                  onTap: () {
                    if (product.isFavorite.value == false) {
                      Get.find<ProductController>()
                          .addProductToFavorite(product.id!, context, index);
                    } else {
                      Get.find<ProductController>()
                          .deleteProductFromFavorite(product.id!, context, index);
                    }
                  },
                  child: Container(
                    height: 30.sp,
                    width: 30.sp,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      gradient: LinearGradient(
                          colors: [AppColor.darkBlue, AppColor.greencolor]),
                    ),
                    child: Center(
                      child: Obx(()=> Icon(  product.isFavorite.value == false?
                        Icons.favorite_outline_rounded : Icons.favorite_sharp,
                        color: Colors.white,
                        size: 17.sp,
                      ),)
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 5.h),
          Text(
            product.name,
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
                SizedBox(
                  width: 100.w,
                  child: Text(
                    '${product.priceD.toString()}  DA',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => {
                    Get.find<ProductController>().resetData(),
                    showAnimatedDialog(context, product, 'Add to cart')
                  },
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
