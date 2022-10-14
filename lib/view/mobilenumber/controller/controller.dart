// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turf_app/view/mobilenumber/model/model.dart';
import 'package:turf_app/view/mobile_verification/view/mobileverification.dart';
import 'package:turf_app/view/mobilenumber/service/service.dart';

class MobileOtpController extends ChangeNotifier {
  final TextEditingController mobileNumberTextfield = TextEditingController();
  MobileNumberRespoModel? mobileId;
  loginMobileOtp(context) {
    final number = mobileNumberTextfield.text.trim();

    if (number.isEmpty) {
      const Text('empty qurie');
    } else {
      MobileNumberRespoModel value = MobileNumberRespoModel(number: number);
      MobileNumberServices.instance.otpverfyimg(value, context);

      saveToSharedPrefMobilrOtp();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MobileVerificationScreen(),
        ),
      );
    }
  }

  saveToSharedPrefMobilrOtp() async {
    //shared preference

    final sharedPrefrence = await SharedPreferences.getInstance();
    //save value
    sharedPrefrence.setString(
      'mobilenumber',
      mobileNumberTextfield.text.trim(),
    );
  }
}
