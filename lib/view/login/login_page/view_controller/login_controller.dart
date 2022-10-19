import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turf_app/view/homepage/view/home_page.dart';
import 'package:turf_app/view/login/login_page/model/login_model.dart';
import 'package:turf_app/view/login/login_page/service/login_service.dart';
import 'package:turf_app/view/login/register_page/view_controller/register_controller.dart';

class LoginController extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscure = true;
  bool isLoading = false;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  loginUser(context) async {
    final signupControllerProvider =
        Provider.of<SignupController>(context, listen: false);
    print('----------------------heeeeeeeeeeee------------');

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
      log('$token  \n$refreshToken');
      signupControllerProvider.saveToken(token!, refreshToken!);
      signupControllerProvider.saveToSharedPref();
      if (loginRespoModel.status == true) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
        saveUserLoggedIn();
      } else if (loginRespoModel.message == null) {
        print('value is null');
      } else {
        print(loginRespoModel.message);
      }
    }
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
