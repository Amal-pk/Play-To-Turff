import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:turf_app/view/homepage/controller/homapage_controller.dart';
import 'package:turf_app/view/splash_screen/controller/afterlogin_controller.dart';

class AfterLogin extends StatelessWidget {
  const AfterLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AfterLoginController>(context);

    WidgetsBinding.instance.addPostFrameCallback(((timeStamp) {
      controller.afterLogin();
    }));
    final homePageController = Provider.of<HomePageController>(context);
    WidgetsBinding.instance.addPostFrameCallback(((timeStamp) {
      homePageController.nearbyTruff();
    }));

    return Scaffold(
      body: Center(
        child: Lottie.asset("asset/image/87026-football-easter-egg.json"),
      ),
    );
  }
}
