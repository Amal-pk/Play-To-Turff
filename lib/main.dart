import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:turf_app/view/booking/controller/controller.dart';
import 'package:turf_app/view/booking/controller/payment_controller.dart';
import 'package:turf_app/view/details/controller/details_controller.dart';
import 'package:turf_app/view/login/emailverification/view_controller/controller.dart';
import 'package:turf_app/view/login/login_page/view_controller/login_controller.dart';
import 'package:turf_app/view/login/mobile_verification/controller/mobileveri_controller.dart';
import 'package:turf_app/view/login/mobilenumber/controller/controller.dart';
import 'package:turf_app/view/login/register_page/view_controller/register_controller.dart';
import 'package:turf_app/view/spot/controller/sopt_controller.dart';
import 'package:turf_app/view/splash_screen/veiw/splash_screen.dart';

import 'view/bottom_navigation/controller/bottomnavigation_controller.dart';

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
          create: ((context) => DetailsController()),
        ),
        ChangeNotifierProvider(
          create: ((context) => SoptController()),
        ),
        ChangeNotifierProvider(
          create: ((context) => BottomNavigationBarController()),
        ),
        ChangeNotifierProvider(
          create: ((context) => BookinController()),
        ),
        ChangeNotifierProvider(
          create: ((context) => PaymentController()),
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
