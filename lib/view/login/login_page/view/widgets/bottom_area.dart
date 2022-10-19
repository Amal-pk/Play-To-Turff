import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turf_app/view/core.dart';
import 'package:turf_app/view/login/emailverification/view/email_verification.dart';
import 'package:turf_app/view/login/login_page/view_controller/login_controller.dart';
import 'package:turf_app/view/login/mobilenumber/view/mobilenumber.dart';
import 'package:turf_app/view/login/register_page/view/register_page.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<LoginController>(context, listen: false);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height / 2.5,
      decoration: const BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          height20,
          ElevatedButton(
            onPressed: (() async {
              controller.isLoading = true;
              // await Future.delayed(Duration(seconds: 5));

              await controller.loginUser(context);

              controller.isLoading = false;

              // controller.emailController.clear();
              // controller.passwordController.clear();
            }),
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all(
                Colors.transparent,
              ),
            ),
            child: Text(
              controller.isLoading == true ? 'loading' : "Sign In",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MobileNumber(),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              height: height / 16,
              width: width / 1.8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: FittedBox(
                child: Row(
                  children: const [
                    Icon(Icons.mobile_friendly),
                    width10,
                    Text(
                      "Continue with Mobile",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          // Container(
          //   padding: const EdgeInsets.all(8),
          //   height: height / 16,
          //   width: width / 1.8,
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(30),
          //   ),
          //   child: FittedBox(
          //     child: Row(
          //       children: [
          //         Image(
          //           image: const AssetImage(
          //             "asset/image/google.png",
          //           ),
          //           height: height / 32,
          //         ),
          //         // width20,
          //         const Text(
          //           "Continue with google",
          //           style: TextStyle(
          //             fontSize: 15,
          //             color: Colors.black,
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 3,
                    right: 3,
                  ),
                  child: Text(
                    "OR",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Already have an account?",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              TextButton(
                onPressed: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const RegisterPage()),
                    ),
                  );
                }),
                child: const Text(
                  "Sign up",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
