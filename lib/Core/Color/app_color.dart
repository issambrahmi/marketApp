import 'package:flutter/material.dart';

class AppColor {
  static const Color mainScreencolor = Color(0xFFEDE9EA);
  static const Color darkBlue = Color(0xFF227DB8);
  static const Color greencolor = Color(0xFF4BBAA7);
  static const Color greyColor = Color(0xFFe2e2e2);
  static Color deleteColor = Colors.red.withOpacity(0.8);

  static LinearGradient primaryGradient =
      const LinearGradient(colors: [darkBlue, greencolor]);
  static LinearGradient secondGradient = LinearGradient(
      colors: [darkBlue.withOpacity(0.2), greencolor.withOpacity(0.9)]);
  static LinearGradient thirdGradient = LinearGradient(
      colors: [darkBlue.withOpacity(0.3), greencolor.withOpacity(0.9)]);
       static LinearGradient forthGradient = LinearGradient(
      colors: [darkBlue.withOpacity(0.1), greencolor.withOpacity(0.7)]);
}
