import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turf_app/view/core.dart';
import 'package:turf_app/view/homepage/view/home_page.dart';
import 'package:turf_app/view/login_page/view_controller/login_controller.dart';
import 'package:turf_app/view/mobilenumber/view/verification/mobileverification.dart';
import 'package:turf_app/view/register_page/view_controller/register_controller.dart';

class BottomContainerOnRegister extends StatelessWidget {
  const BottomContainerOnRegister({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<RegisterController>(context, listen: false);
    final logincontroller =
        Provider.of<LoginController>(context, listen: false);
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
        children: [
          height50,
          ElevatedButton(
            onPressed: (() {
              controller.userCreation(context);
              controller.clearData(context);
            }),
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all(
                Colors.transparent,
              ),
            ),
            child: const Text(
              "Sign In",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          height20,
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
          height20,
          GestureDetector(
            onTap: (() {
              // controller.SignupEmailValidation(value);
              controller.clearData(context);
            }),
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
                  children: [
                    Image(
                      image: const AssetImage(
                        "asset/image/google.png",
                      ),
                      height: height / 32,
                    ),
                    // width20,
                    const Text(
                      "Continue with google",
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
        ],
      ),
    );
  }
}
