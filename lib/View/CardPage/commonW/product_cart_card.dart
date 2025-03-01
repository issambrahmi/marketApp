import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:market_app/Controller/card_controller.dart';
import 'package:market_app/Controller/home_page_controller.dart';
import 'package:market_app/Controller/product_controller.dart';
import 'package:market_app/Core/Color/app_color.dart';
import 'package:market_app/Core/Services/hive_services.dart';
import 'package:market_app/Core/Shared%20widgets/app_alert_dialogue.dart';
import 'package:market_app/Core/Shared%20widgets/product_qnt_dialogue.dart';
import 'package:market_app/Model/Models/order_model.dart';

class OrderItemCard extends StatelessWidget {
  const OrderItemCard({super.key, required this.item, required this.index});

  final OrderItemModel item;
  final int index;
  @override
  Widget build(BuildContext context) {
    CardController cardController = Get.find<CardController>();
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
                  item.product.name,
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
                '${(item.type == 'd' ? item.product.priceD : item.type == 'g' ? item.product.priceG : item.product.priceSG) * item.qnt} Da',
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
              SizedBox(
                width: MediaQuery.of(context).size.width -
                    40.w - // page padding
                    80.sp - // image width
                    10.w - //space
                    20.w - // container padding
                    80.w - // text sized
                    10.w, //space
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 30.sp,
                      width: 30.sp,
                      decoration: BoxDecoration(
                          color: AppColor.greencolor,
                          borderRadius: BorderRadius.circular(10)),
                      child: GestureDetector(
                        onTap: () => productQntDialogue(
                            context: context,
                            product: cardController.cardItems[index].product,
                            text: 'Edit',
                            isEdit: true,
                            qnt: item.qnt,
                            type: item.type,
                            confirmTap: () {
                              ProductController controller =
                                  Get.find<ProductController>();
                              if (controller.quanity.value != item.qnt) {
                                item.qnt = controller.quanity.value;
                              }
                              if (controller.selectedPriceOption.value !=
                                  item.type) {
                                item.type =
                                    controller.selectedPriceOption.value;
                              }
                              controller.resetData();
                              cardController.update();
                              Get.back();
                            }),
                        child: Center(
                          child: Icon(
                            Icons.edit,
                            size: 18.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    GestureDetector(
                      onTap: () => appAlertDialogue(
                          context: context,
                          height: 200.h,
                          confirmTap: () {
                            HiveServices.deleteProductFromCard(index);
                            Get.find<CardController>()
                                .cardItems
                                .removeAt(index);
                            Get.find<CardController>().update();
                            Get.back();
                          },
                          text:
                              'Are you sure you want to delete this product from card ?'),
                      child: Container(
                        height: 30.sp,
                        width: 30.sp,
                        decoration: BoxDecoration(
                            color: AppColor.deleteColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Icon(
                            Icons.delete,
                            size: 18.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30.sp,
                width: MediaQuery.of(context).size.width -
                    40.w - // page padding
                    80.sp - // image width
                    10.w - //space
                    20.w - // container padding
                    80.w - // text sized
                    10.w, //space
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () => cardController.minusQnt(index),
                      child: Container(
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
                    ),
                    SizedBox(width: 10.w),
                    GetBuilder<CardController>(builder: (cntrl) {
                      return SizedBox(
                        width: 30.w,
                        child: Text(
                          item.qnt.toString(),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 12.sp),
                        ),
                      );
                    }),
                    SizedBox(width: 10.w),
                    InkWell(
                      onTap: () => cardController.plusQnt(index),
                      child: Container(
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
