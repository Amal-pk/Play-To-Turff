import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turf_app/view/emailverification/view/email_verification.dart';
import 'package:turf_app/view/homepage/view/home_page.dart';
import 'package:turf_app/view/login_page/view/login_page.dart';
import 'package:turf_app/view/register_page/model/register_model.dart';
import 'package:turf_app/view/register_page/service/register_service.dart';

class RegisterController extends ChangeNotifier {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final conformController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void clearData(context) {
    nameController.clear();
    phoneController.clear();
    conformController.clear();
    emailController.clear();
    passwordController.clear();
  }

  userCreation(context) {
    final registerService = RegisterService();
    final name = nameController.text.trim();
    final phone = phoneController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final conform = conformController.text.trim();
    if (name.isEmpty ||
        phone.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        conform.isEmpty) {
      const Text('Empty');
    } else {
      RegisterModel value = RegisterModel(
        userEmail: email,
        userPassword: password,
      );
      registerService.signupUser(value.tojson());
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const PinCodeVerificationScreen('amalpkdrv@gmail.com')),
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
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    }
  }

  clearSavedData(context) async {
    final sharedPrefrence = await SharedPreferences.getInstance();
    sharedPrefrence.remove('email');
    sharedPrefrence.remove('password');

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  String? SignupPsswrdValidation(value) {
    if (value!.isEmpty) {
      return 'Password is empty';
    }
    return null;
  }

  // ignore: non_constant_identifier_names
  String? SignupEmailValidation(value) {
    if (value!.isEmpty) {
      return 'Email is empty';
    }
    return null;
  }
}
