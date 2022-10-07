import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turf_app/view/homepage/view/home_page.dart';
import 'package:turf_app/view/login_page/model/login_model.dart';
import 'package:turf_app/view/login_page/service/login_service.dart';

class LoginController extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  bool obscure = true;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  isobscure() {
    obscure = !obscure;
    notifyListeners();
  }

  signin(context) {
    final logniService = LoginService();

    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    print("sjsjsvlsmvlcmslfm");
    if (email.isEmpty || password.isEmpty) {
      const Text("Empty");
    } else {
      LoginModel value = LoginModel(email: email, password: password);
      // logniService.usersLogin(value.toJoson());
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    }
    notifyListeners();
  }
  // get visibty=>_obscure;
}
