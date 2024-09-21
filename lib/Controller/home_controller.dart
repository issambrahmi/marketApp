import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_app/View/HomePage/home_page.dart';
import 'package:market_app/View/SearchPage/search_page.dart';

class HomeController extends GetxController {
  Widget currentPage = HomePage();
  int currentIndex = 0;
  List<Widget> pages = [HomePage() ,SearchPage(), Scaffold() , Scaffold() , Scaffold()];

  void ontapIcon(int index) {
    currentPage = pages[index];
    currentIndex = index;
    update();
  }
}
