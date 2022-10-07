import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turf_app/view/core.dart';
import 'package:turf_app/view/login_page/view/widgets/bottom_area.dart';
import 'package:turf_app/view/login_page/view/widgets/widget.dart';
import 'package:turf_app/view/mobilenumber/controller/controller.dart';
import 'package:turf_app/view/mobilenumber/view/widget/bottom_area.dart';
import 'package:turf_app/view/register_page/view/widget/textfield.dart';

class MobileNumber extends StatelessWidget {
  const MobileNumber({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<MobileOtpController>(context, listen: false);
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height / 8.3,
                ),
                const Text(
                  'HELLO',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
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
                    controller: controller.mobileNumberTextfield,
                    hint: 'Mobile Number',
                    icon: Icons.phone_android,
                    validator: '',
                    keybord: TextInputType.phone,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: (() {}),
                      child: const Text(
                        "Login With Email",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: (() {
                    controller.loginMobileOtp(context);
                  }),
                  child: Text('login'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
