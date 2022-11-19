import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turf_app/view/bottom_navigation/view/bottom_navigation.dart';

class AfterLoginController extends ChangeNotifier {
  afterLogin() async {
    log("sdnjnsjnfjsdncjdnksdnnaksjdnknsakjdk");
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString('Token');
    if (token != null || token!.isNotEmpty) {
      await Future.delayed(const Duration(seconds: 2));
      Get.off(() => BottomNavigation());
    }
  }
}
