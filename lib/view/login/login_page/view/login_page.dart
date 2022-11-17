import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turf_app/view/core.dart';
import 'package:turf_app/view/login/login_page/view_controller/login_controller.dart';
import 'package:turf_app/view/login/login_page/view/widgets/bottom_area.dart';
import 'package:turf_app/view/login/login_page/view/widgets/widget.dart';
import 'package:turf_app/view/login/register_page/view/widget/textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<LoginController>(context, listen: false);
    final height = MediaQuery.of(context).size.height;
 
    // final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<LoginController>(builder: (context, value, _) {
          return SingleChildScrollView(
            child: Form(
              key: controller.formkey,
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
                    child: TextFieldWidget(
                      controller: controller.emailController,
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
                      controller: controller.passwordController,
                      hint: 'Password',
                      icon: Icons.password_sharp,
                      validator: '',
                      keybord: TextInputType.visiblePassword,
                      suffIcon: IconButton(
                        onPressed: () {
                          controller.isobscure();
                        },
                        icon: controller.obscure
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                      ),
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
          );
        }),
      ),
    );
  }
}
