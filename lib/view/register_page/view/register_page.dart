import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turf_app/view/core.dart';
import 'package:turf_app/view/login_page/view/widgets/widget.dart';
import 'package:turf_app/view/login_page/view_controller/login_controller.dart';
import 'package:turf_app/view/register_page/view_controller/register_controller.dart';
import 'package:turf_app/view/register_page/view/widget/bottom_area.dart';
import 'package:turf_app/view/register_page/view/widget/textfield.dart';

class RegisterPage extends StatelessWidget {
 const RegisterPage({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<RegisterController>(context,listen: false);
    final loginController = Provider.of<LoginController>(context,listen: false);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: (() {
                  Navigator.of(context).pop();
                  controller.clearData(context);
                }),
                icon: const Icon(
                  Icons.arrow_back,
                  size: 25,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 36,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Please register to continue.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    height20,
                    TextFieldWidget(
                      hint: "Name",
                      validator: "",
                      controller: controller.nameController,
                      keybord: TextInputType.name,
                      icon: Icons.person,
                    ),
                    height20,
                    TextFieldWidget(
                      hint: "Mobile Number",
                      validator: "",
                      controller: controller.phoneController,
                      keybord: TextInputType.phone,
                      icon: Icons.phone,
                    ),
                    height20,
                    TextFieldWidget(
                      hint: "Email",
                      validator: "",
                      controller: loginController.emailController,
                      keybord: TextInputType.emailAddress,
                      icon: Icons.email,
                    ),
                    height20,
                    TextFieldWidgets(
                      hint: "Password",
                      validator: "",
                      controller: loginController.passwordController,
                      keybord: TextInputType.visiblePassword,
                      icon: Icons.password,
                      suffIcon: IconButton(
                        onPressed: () {
                          Provider.of<LoginController>(context, listen: false)
                              .isobscure();
                        },
                        icon:
                            Provider.of<LoginController>(context, listen: true)
                                    .obscure
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                      ),
                    ),
                    height20,
                    TextFieldWidgets(
                      hint: "Conform",
                      validator: "",
                      controller: controller.conformController,
                      keybord: TextInputType.visiblePassword,
                      icon: Icons.password,
                      suffIcon: IconButton(
                        onPressed: () {
                          Provider.of<LoginController>(context, listen: false)
                              .isobscure();
                        },
                        icon:
                            Provider.of<LoginController>(context, listen: true)
                                    .obscure
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                      ),
                    ),
                  ],
                ),
              ),
              height20,
              const BottomContainerOnRegister(),
            ],
          ),
        ),
      ),
    );
  }
}
