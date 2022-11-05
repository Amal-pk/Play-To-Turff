import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turf_app/view/core.dart';
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
    return Consumer<LoginController>(builder: (context, value, _) {
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
            Consumer<LoginController>(builder: (context, value, _) {
              return ElevatedButton(
                onPressed: (() async {
                  await value.loginUser(context);
                }),
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.all(
                    Colors.transparent,
                  ),
                ),
                child: Consumer<LoginController>(builder: (context, value, _) {
                  return controller.isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 4, 73, 7),
                          ),
                        );
                }),
              );
            }),
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
    });
  }
}
