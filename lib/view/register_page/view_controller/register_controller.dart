import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turf_app/view/emailverification/view/email_verification.dart';
import 'package:turf_app/view/login_page/view/login_page.dart';
import 'package:turf_app/view/register_page/model/register_model.dart';
import 'package:turf_app/view/register_page/service/register_service.dart';

class SignupController extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  SignUpRespoModel? signUpRespoModel;

  void createUser(context) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    print('xfkmvnjzdnvn');
    if (email.isEmpty || password.isEmpty) {
      return;
    } else {
      SignUpModel value = SignUpModel(userMail: email, userPassword: password);
      signUpRespoModel =
          await SignupService.instance.signupUser(value, context);
      if (signUpRespoModel!.status == true) {
        log(signUpRespoModel!.status.toString());
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const PinCodeVerificationScreen('amalpkdrv@gmail.com'),
          ),
        );
      }
    }
    saveToSharedPref();
  }

  saveToSharedPref() async {
    //shared preference

    final sharedPrefrence = await SharedPreferences.getInstance();
    //save value
    sharedPrefrence.setString('email', emailController.text.trim());
    sharedPrefrence.setString('password', passwordController.text.trim());
  }

  getSavedData(context) async {
    final sharedPrefrence = await SharedPreferences.getInstance();
    final savedEmailValue = sharedPrefrence.getString('email');
    final savedPasswordValue = sharedPrefrence.getString('password');
    if (savedEmailValue != null || savedPasswordValue != null) {
      // Navigator.push(
      // context, MaterialPageRoute(builder: (context) => Homepage())
      // );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    }
  }

  clearSavedData(context) async {
    final sharedPrefrence = await SharedPreferences.getInstance();
    sharedPrefrence.remove('email');
    sharedPrefrence.remove('password');

    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => Homepage()));
  }

  // ignore: non_constant_identifier_names
  String? SignupPsswrdValidation(value) {
    if (value!.isEmpty && value == null) {
      return 'Password is empty';
    }
    return null;
  }

  // ignore: non_constant_identifier_names
  String? SignupEmailValidation(value) {
    if (value!.isEmpty && value == null) {
      return 'Email is empty';
    }
    return null;
  }

  clearData(context) {
    // nameController.clear();
    // phoneController.clear();
    // conformController.clear();
    emailController.clear();
    passwordController.clear();
  }
}
