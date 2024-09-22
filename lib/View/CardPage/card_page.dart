import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:market_app/View/CardPage/commonW/card_products.dart';
import 'package:market_app/main.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Card',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 22.sp,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 26.sp,
          ),
          onPressed: () {
            Get.back(); //
          },
        ),
      ),
      body: SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.w),
            child: ListView(
                    children: const [
            CardProducts()
                    ],
                  ),
          )),
    );
  }
}
