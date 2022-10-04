import 'package:flutter/material.dart';
import 'package:turf_app/view/core.dart';
import 'package:turf_app/view/login_page/view/widgets/bottom_area.dart';
import 'package:turf_app/view/login_page/view/widgets/widget.dart';
import 'package:turf_app/view/register_page/view/widget/bottom_area.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: (() {
                  Navigator.of(context).pop();
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
                    TextFieldWidgets(
                      hint: "Name",
                      validator: "",
                      controller: nameController,
                      keybord: TextInputType.name,
                      icon: Icons.person,
                    ),
                    height20,
                    TextFieldWidgets(
                      hint: "Mobile Number",
                      validator: "",
                      controller: nameController,
                      keybord: TextInputType.phone,
                      icon: Icons.phone,
                    ),
                    height20,
                    TextFieldWidgets(
                      hint: "Email",
                      validator: "",
                      controller: nameController,
                      keybord: TextInputType.emailAddress,
                      icon: Icons.email,
                    ),
                    height20,
                    TextFieldWidgets(
                      hint: "Password",
                      validator: "",
                      controller: nameController,
                      keybord: TextInputType.visiblePassword,
                      icon: Icons.password,
                    ),
                    height20,
                    TextFieldWidgets(
                      hint: "Conform",
                      validator: "",
                      controller: nameController,
                      keybord: TextInputType.visiblePassword,
                      icon: Icons.password,
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
