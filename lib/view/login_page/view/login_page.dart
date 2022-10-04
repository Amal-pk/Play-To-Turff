import 'package:flutter/material.dart';
import 'package:turf_app/view/core.dart';
import 'package:turf_app/view/login_page/view/widgets/bottom_area.dart';
import 'package:turf_app/view/login_page/view/widgets/widget.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height / 8.3,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    'HELLO',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Singin On Your account',
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                ),
                height50,
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFieldWidgets(
                    controller: emailController,
                    hint: 'Email',
                    icon: Icons.email,
                    validator: '',
                    keybord: TextInputType.emailAddress,
                  ),
                ),
                height20,
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16),
                  child: TextFieldWidgets(
                    obscure: true,
                    controller: passwordController,
                    hint: 'Password',
                    icon: Icons.password_sharp,
                    validator: '',
                    keybord: TextInputType.visiblePassword,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: (() {}),
                      child: const Text(
                        "Forgot Password",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                height50,
                const BottomContainer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
