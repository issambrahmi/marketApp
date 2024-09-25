import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_app/View/CardPage/commonW/card_products.dart';
import 'package:market_app/View/CardPage/commonW/card_top_sect.dart';
import 'package:market_app/View/CardPage/commonW/down_card_page.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          const CardTopSect(),
          SizedBox(height: 10.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ListView(
                children: const [CardProducts()],
              ),
            ),
          ),
          const DownCardPage(),
        ],
      )),
    );
  }
}
