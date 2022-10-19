import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turf_app/view/splash_screen/splash_controller.dart';

class SplashScreen extends GetView<SplashScreenController> {
  SplashScreen({super.key});
  final splaController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('SplashScreen'),
      ),
    );
  }
}
