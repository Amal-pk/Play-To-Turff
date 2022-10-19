import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:turf_app/view/login/emailverification/view_controller/controller.dart';
import 'package:turf_app/view/homepage/controller/homapage_controller.dart';
import 'package:turf_app/view/login/login_page/view_controller/login_controller.dart';
import 'package:turf_app/view/login/login_page/view/login_page.dart';
import 'package:turf_app/view/login/mobile_verification/controller/mobileveri_controller.dart';
import 'package:turf_app/view/login/mobilenumber/controller/controller.dart';
import 'package:turf_app/view/login/register_page/view_controller/register_controller.dart';
import 'package:turf_app/view/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => LoginController()),
        ),
        ChangeNotifierProvider(
          create: ((context) => SignupController()),
        ),
        ChangeNotifierProvider(
          create: ((context) => MobileOtpController()),
        ),
        ChangeNotifierProvider(
          create: ((context) => EmailVerificationController()),
        ),
        ChangeNotifierProvider(
          create: ((context) => MobileVerificationController()),
        ),
        ChangeNotifierProvider(
          create: ((context) => MobileOtpController()),
        ),
        ChangeNotifierProvider(
          create: ((context) => HomePageController()),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
