import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turf_app/view/emailverification/view_controller/controller.dart';
import 'package:turf_app/view/login_page/view_controller/login_controller.dart';
import 'package:turf_app/view/login_page/view/login_page.dart';
import 'package:turf_app/view/mobilenumber/controller/controller.dart';
import 'package:turf_app/view/register_page/view_controller/register_controller.dart';

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
          create: ((context) => RegisterController()),
        ),
        ChangeNotifierProvider(
          create: ((context) => MobileOtpController()),
        ),
        ChangeNotifierProvider(
          create: ((context) => EmailVerificationController()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const LoginPage(),
      ),
    );
  }
}
