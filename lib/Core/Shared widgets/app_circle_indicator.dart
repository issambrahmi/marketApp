import 'package:flutter/material.dart';
import 'package:market_app/Core/Color/app_color.dart';

class AppCircleIndicator extends StatelessWidget {
  const AppCircleIndicator({super.key, required this.size});
  final double size;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppColor.greencolor,
        value: size,
      ),
    );
  }
}
