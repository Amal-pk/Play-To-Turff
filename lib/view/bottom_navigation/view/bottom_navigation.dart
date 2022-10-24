import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turf_app/view/bottom_navigation/controller/bottomnavigation_controller.dart';

class BottomNavigation extends GetView<BottomNavigationBarController> {
  BottomNavigation({super.key});
  @override
  final controller = Get.put(BottomNavigationBarController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: controller.pages[controller.currentIntex.value],
        extendBody: true,
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.green,
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.black,
            currentIndex: controller.currentIntex.value,
            onTap: (value) => controller.currentIntex.value = value,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.stadium_sharp),
                label: 'Spot',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              )
            ],
          ),
        ),
      ),
    );
  }
}
