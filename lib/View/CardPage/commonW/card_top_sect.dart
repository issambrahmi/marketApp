import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:market_app/Controller/card_controller.dart';
import 'package:market_app/Core/Color/app_color.dart';
import 'package:market_app/Core/Services/hive_services.dart';
import 'package:market_app/Core/Shared%20widgets/app_alert_dialogue.dart';

class CardTopSect extends StatelessWidget {
  const CardTopSect({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            color: AppColor.mainScreencolor,
            blurRadius: 10,
          )
        ]),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    if (Get.find<CardController>().editedItems.isNotEmpty) {
                      appAlertDialogue(
                          context: context,
                          text:
                              'u have modified some products do u wanna continue ?',
                          height: 200.h,
                          confirmTap: () {
                            Get.back();
                            Get.back();
                          });
                    } else {
                      Get.back();
                    }
                  },
                  style: IconButton.styleFrom(
                    backgroundColor: AppColor.mainScreencolor,
                  ),
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                  )),
              Text(
                'My Cart',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.sp,
                ),
              ),
              GestureDetector(
                onTap: () => appAlertDialogue(
                    context: context,
                    height: 200.h,
                    confirmTap: () {
                      HiveServices.clearCard();
                      Get.find<CardController>().cardItems = [];
                      Get.find<CardController>().update();
                      Get.back();
                    },
                    text:
                        'All product will be deleted , are you sure u want do clear cart'),
                child: Container(
                  height: 25.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                    color: AppColor.deleteColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'clear',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              if (Get.find<CardController>().editedItems.isNotEmpty)
                InkWell(
                  onTap: () => Get.find<CardController>().saveChanges(),
                  child: Container(
                    height: 25.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                      //color: AppColor.greencolor,
                      gradient: const LinearGradient(
                          colors: [AppColor.darkBlue, AppColor.greencolor]),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Save',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                )
            ],
          ),
        ));
  }
}
