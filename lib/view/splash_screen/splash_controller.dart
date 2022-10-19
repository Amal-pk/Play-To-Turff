import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turf_app/view/homepage/controller/location_controller.dart';
import 'package:turf_app/view/homepage/view/home_page.dart';
import 'package:turf_app/view/login/login_page/view/login_page.dart';

class SplashScreenController extends GetxController {
  final locationController = Get.put(LocationController());
  @override
  void onInit() {
    checkUserLoggedIn();
    locationController.getCurrentPosition();
    super.onInit();
  }

  checkUserLoggedIn() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final checked = pref.getBool('userloggedin');
    if (checked == false || checked == null) {
      await Future.delayed(const Duration(seconds: 2));
      Get.to(() => const LoginPage());
    } else {
      await Future.delayed(const Duration(seconds: 2));
      Get.to(() => HomePage());
    }
  }
}
