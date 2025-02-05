import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:market_app/Controller/add_product_controller.dart';
import 'package:market_app/Core/Color/app_color.dart';
import 'package:market_app/Core/Shared%20widgets/app_button.dart';
import 'package:market_app/Model/Models/product_model.dart';

void showAnimatedDialog(
    BuildContext context, ProductModel product, String text) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'hi',
    barrierColor: Colors.black.withOpacity(0.5), // Background dimming
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (context, animation1, animation2) {
      AddProductController controller = Get.find<AddProductController>();
      return Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: double.infinity,
            height: 420.h,
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 80.sp,
                      width: 80.sp,
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
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 150.w,
                          child: Text(
                            product.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            Text(
                              'min Quanity : ',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 5.w),
                            GetBuilder<AddProductController>(
                                builder: (controller) {
                              return Text(
                                controller.selectedPriceOption.value ==
                                        'Per Unit'
                                    ? '1'
                                    : controller.selectedPriceOption.value ==
                                            'Gros'
                                        ? product.minQntG.toString()
                                        : product.minQntSG.toString(),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              );
                            }),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        GetBuilder<AddProductController>(builder: (controller) {
                          return Text(
                            controller.selectedPriceOption.value == 'Per Unit'
                                ? product.priceD.toString()
                                : controller.selectedPriceOption.value == 'Gros'
                                    ? product.priceG.toString()
                                    : product.priceG.toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                SizedBox(
                  height: 50.h,
                  child: DropdownButtonFormField<String>(
                    //  dropdownColor: AppColor.mainScreencolor,
                    value: controller.selectedPriceOption.value,
                    decoration: InputDecoration(
                        fillColor: AppColor.mainScreencolor,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none)),
                    items: [
                      DropdownMenuItem(
                        value: 'Per Unit',
                        child: Text(
                          'Per Unit',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const DropdownMenuItem(
                        value: 'Gros',
                        child: Text('Wholesale'),
                      ),
                      const DropdownMenuItem(
                        value: 'Super Gros',
                        child: Text('Super Wholesale'),
                      ),
                    ],
                    onChanged: (value) {
                      Get.find<AddProductController>()
                          .selectedPriceOption
                          .value = value!;
                      Get.find<AddProductController>().update();
                    },
                  ),
                ),
                SizedBox(height: 30.h),
                const DialogueFormField(),
                SizedBox(height: 30.h),
                Row(
                  children: [
                    Text(
                      'Totale price : ',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Obx(
                      () => Text(
                        '${(controller.quanity * (controller.selectedPriceOption.value == 'Per Unit' ? product.priceD : controller.selectedPriceOption.value == 'Super Gros' ? product.priceG : product.priceSG)).toString()} Da',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppButton(
                      text: 'Cancel',
                      height: 40.h,
                      width: 125.w,
                      textSize: 15.sp,
                      color: AppColor.deleteColor,
                      onTap: () => Get.back(),
                    ),
                    AppButton(
                      text: text,
                      height: 40.h,
                      width: 125.w,
                      textSize: 13.sp,
                      gradient: const LinearGradient(
                          colors: [AppColor.darkBlue, AppColor.greencolor]),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    },
    transitionBuilder: (context, anim1, anim2, child) {
      return ScaleTransition(
        scale: Tween<double>(begin: 0.7, end: 1.0).animate(
          CurvedAnimation(
            parent: anim1,
            curve: Curves.easeInOut,
          ),
        ),
        child: child,
      );
    },
  );
}

class DialogueFormField extends StatelessWidget {
  const DialogueFormField({super.key});

  @override
  Widget build(BuildContext context) {
    AddProductController controller = Get.find<AddProductController>();
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        width: 45.sp,
        height: 45.sp,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.mainScreencolor),
        child: IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {
            controller.minus();
          },
        ),
      ),
      SizedBox(width: 10.w),
      SizedBox(
        width: 45.sp,
        height: 45.sp,
        child: TextFormField(
          controller: controller.quantityController,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
              // border: OutlineInputBorder(),
              focusedBorder:
                  UnderlineInputBorder(borderSide: BorderSide(width: 1.5))),
          onChanged: (value) {
            int? newQuantity = int.tryParse(value);
            if (newQuantity != null && newQuantity > 0) {
              controller.quanity.value =
                  int.parse(controller.quantityController.text);
            }
          },
        ),
      ),
      SizedBox(width: 10.w),
      Container(
        width: 45.sp,
        height: 45.sp,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.mainScreencolor),
        child: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            controller.plus();
          },
        ),
      ),
    ]);
  }
}
