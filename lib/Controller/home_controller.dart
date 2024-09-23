import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_app/View/HomePage/home_page.dart';
import 'package:market_app/View/Orders%20Page/orders_page.dart';
import 'package:market_app/View/SearchPage/search_page.dart';

class HomeController extends GetxController {
  Widget currentPage = const HomePage();
  int currentIndex = 0;
  List<Widget> pages = [
    const HomePage(),
    const SearchPage(),
    const Scaffold(),
    const OrdersPage(),
    const Scaffold()
  ];

  void ontapIcon(int index) {
    currentPage = pages[index];
    currentIndex = index;
    update();
  }
}
