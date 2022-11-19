import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turf_app/view/bottom_navigation/controller/bottomnavigation_controller.dart';
import 'package:turf_app/view/bottom_navigation/view/bottom_navigation.dart';
import 'package:turf_app/view/login/login_page/model/login_model.dart';
import 'package:turf_app/view/login/login_page/service/login_service.dart';
import 'package:turf_app/view/login/register_page/view_controller/register_controller.dart';
import 'package:turf_app/view/splash_screen/veiw/after_login.dart';
import 'package:turf_app/view/splash_screen/veiw/splash_screen.dart';

class LoginController extends ChangeNotifier {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscure = true;
  bool isLoading = false;

  loginUser(context) async {
    final signupControllerProvider =
        Provider.of<SignupController>(context, listen: false);
    // print('----------------------heeeeeeeeeeee------------');
    isLoading = true;
    final controller =
        Provider.of<BottomNavigationBarController>(context, listen: false);
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Enter valied Data'),
        ),
      );
    } else {
      LoginModel value = LoginModel(userMail: email, userPassword: password);
      LoginRespoModel? loginRespoModel =
          await LoginService.instance.userLogin(value, context);
      var token = loginRespoModel!.token;
      var refreshToken = loginRespoModel.refreshToken;
      log('tok$token  \nref$refreshToken');
      signupControllerProvider.saveToken(token!, refreshToken!);
      signupControllerProvider.saveToSharedPref();
      if (loginRespoModel.status == true) {
        controller.currentIndex = 0;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AfterLogin(),
          ),
        );
        saveUserLoggedIn();
      } else if (loginRespoModel.message == null) {
        print('value is null');
      } else {
        print(loginRespoModel.message);
      }
    }
    isLoading = false;
    notifyListeners();
  }

  saveUserLoggedIn() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('userloggedin', true);
  }

  isobscure() {
    obscure = !obscure;
    notifyListeners();
  }
}
