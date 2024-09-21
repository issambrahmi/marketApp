import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_app/Controller/home_controller.dart';
import 'package:market_app/View/Home/CommonW/floatingbutton.dart';
import 'package:market_app/View/Home/CommonW/my_bottom_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: const MyBottomAppBar(),
      floatingActionButton: const MyFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: GetBuilder<HomeController>(builder: (controller) {
        return controller.currentPage;
      }),
    );
  }
}
