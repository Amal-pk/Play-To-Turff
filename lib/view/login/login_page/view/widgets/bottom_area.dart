import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turf_app/view/core.dart';
import 'package:turf_app/view/homepage/controller/homapage_controller.dart';
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
    final homePageController = Provider.of<HomePageController>(context);
    WidgetsBinding.instance.addPostFrameCallback(((timeStamp) {
      homePageController.nearbyTruff();
    }));
    return Consumer<LoginController>(builder: (context, value, _) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          height20,
          Consumer<LoginController>(
            builder: (context, value, _) {
              return ElevatedButton(
                onPressed: (() async {
                  await value.loginUser(context);
                }),
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.all(
                    Colors.green,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Consumer<LoginController>(
                    builder: (context, value, _) {
                      return controller.isLoading == true
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(
                              "Sign In",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            );
                    },
                  ),
                ),
              );
            },
          ),
          height20,
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MobileNumber(),
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
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3,
                  )
                ],
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
          height20,
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
                    color: Colors.green,
                    fontSize: 18,
                  ),
                ),
              )
            ],
          )
        ],
      );
    });
  }
}
