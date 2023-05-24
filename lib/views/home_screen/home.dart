import 'package:ecommerce/const/consts.dart';
import 'package:ecommerce/controllers/home_controller.dart';
import 'package:ecommerce/views/cart_screen/cart_screen.dart';
import 'package:ecommerce/views/category_screen/categoru_screen.dart';
import 'package:ecommerce/views/home_screen/home_screen.dart';
import 'package:ecommerce/views/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    //init home Controller
    var controller = Get.put(HomeController());
    var navbarItem = [
      BottomNavigationBarItem(
          icon: Image.asset(
            icHome,
            width: 26,
          ),
          label: home),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCategories,
            width: 26,
          ),
          label: categories),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCart,
            width: 26,
          ),
          label: cart),
      BottomNavigationBarItem(
          icon: Image.asset(
            icProfile,
            width: 26,
          ),
          label: account),
    ];
    var navBody = [
      const HomeScren(),
      const CategoryScreen(),
      const CartScreen(),
      const ProfileScreen(),
    ];
    return Scaffold(
      body: Column(
        children: [
          Obx(
            () => Expanded(
              child: navBody.elementAt(controller.currentNavIndex.value),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          selectedItemColor: redColor,
          selectedLabelStyle: const TextStyle(fontFamily: semibold),
          items: navbarItem,
          backgroundColor: whiteColor,
          type: BottomNavigationBarType.fixed,
          onTap: ((value) {
            controller.currentNavIndex.value = value;
          }),
        ),
      ),
    );
  }
}
