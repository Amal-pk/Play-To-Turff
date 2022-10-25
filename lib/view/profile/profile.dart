import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turf_app/view/homepage/controller/homapage_controller.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  final HomePageController homePageController = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IconButton(
          onPressed: () {
            homePageController.logOut();
          },
          icon: Icon(Icons.exit_to_app),
        ),
      ),
    );
  }
}
