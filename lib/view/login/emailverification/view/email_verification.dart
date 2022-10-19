import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:turf_app/view/login/emailverification/view_controller/controller.dart';
import 'package:turf_app/view/login/register_page/view_controller/register_controller.dart';

class PinCodeVerificationScreen extends StatelessWidget {
  final String email;

  const PinCodeVerificationScreen(this.email, {super.key});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final emailVerificationController =
        Provider.of<EmailVerificationController>(context);
    final signupController =
        Provider.of<SignupController>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.07,
            ),
            const Text(
              'Verification Code',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: 32.0,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text:
                        'Please enter the verification code that we have sent to your email ',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xff808d9e),
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),
                  TextSpan(
                    text: signupController.emailController.text.trim(),
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.green,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.1,
            ),

            /// pinput package we will use here
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                width: width,
                child: Pinput(
                  controller:
                      emailVerificationController.emailEditingController,
                  length: 4,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  defaultPinTheme: PinTheme(
                    height: 60.0,
                    width: 60.0,
                    textStyle: const TextStyle(
                      fontSize: 24.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black.withOpacity(0.5),
                        width: 1.0,
                      ),
                    ),
                  ),
                  focusedPinTheme: PinTheme(
                    height: 60.0,
                    width: 60.0,
                    textStyle: const TextStyle(
                      fontSize: 24.0,
                      color: Colors.green,
                      fontWeight: FontWeight.w700,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.green,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 18.0,
            ),
            const Center(
              child: Text(
                'Dont Skip the page, please complete the verification',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            /// Continue Button
            const Expanded(child: SizedBox()),
            InkWell(
              onTap: () {
                emailVerificationController.verifyEmailOtp(context);
                print('object');
              },
              borderRadius: BorderRadius.circular(30.0),
              child: Ink(
                height: 55.0,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.green,
                ),
                child: const Center(
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}
