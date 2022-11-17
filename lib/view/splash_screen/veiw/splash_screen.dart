import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:turf_app/view/homepage/controller/homapage_controller.dart';
import 'package:turf_app/view/splash_screen/controller/splash_controller.dart';

class SplashScreen extends GetView<SplashScreenController> {
  SplashScreen({super.key});
  final splaController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    final homePageController = Provider.of<HomePageController>(context);
    WidgetsBinding.instance.addPostFrameCallback(((timeStamp) {
      homePageController.nearbyTruff();
    }));
    return const Scaffold(
      body: Center(
        child: Text('SplashScreen'),
      ),
    );
  }
}
