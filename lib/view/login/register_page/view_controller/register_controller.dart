import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turf_app/view/login/emailverification/view/email_verification.dart';
import 'package:turf_app/view/login/login_page/view/login_page.dart';
import 'package:turf_app/view/login/register_page/model/register_model.dart';
import 'package:turf_app/view/login/register_page/service/register_service.dart';

class SignupController extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final conformController = TextEditingController();
  SignUpRespoModel? signUpRespoModel;

  void createUser(context) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final conform = conformController.text.trim();
    if (password == conform) {
      print('xfkmvnjzdnvn');
      if (email.isEmpty || password.isEmpty) {
        return;
      } else {
        SignUpModel value =
            SignUpModel(userMail: email, userPassword: password);
        signUpRespoModel =
            await SignupService.instance.signupUser(value, context);
        if (signUpRespoModel!.status == true) {
          log(signUpRespoModel!.status.toString());
          clearData(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const PinCodeVerificationScreen('amalpkdrv@gmail.com'),
            ),
          );
        }
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Wrong Password'),
          backgroundColor: Color.fromARGB(255, 97, 98, 97),
        ),
      );
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

  saveToken(String token, String refreshToken) async {
    SharedPreferences sT = await SharedPreferences.getInstance();
    sT.setString("Token", token);
    sT.setString("RefreshToken", refreshToken);
  }

  clearData(context) {
    conformController.clear();
    emailController.clear();
    passwordController.clear();
  }
}
