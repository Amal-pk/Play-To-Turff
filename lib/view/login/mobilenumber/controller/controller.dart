// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turf_app/view/login/mobilenumber/model/model.dart';
import 'package:turf_app/view/login/mobile_verification/view/mobileverification.dart';
import 'package:turf_app/view/login/mobilenumber/service/service.dart';

class MobileOtpController extends ChangeNotifier {
  final TextEditingController mobileNumberTextfield = TextEditingController();
  MobileNumberRespoModel? mobileId;
  loginMobileOtp(context) async {
    final number = mobileNumberTextfield.text.trim();
    if (number.isEmpty) {
      log(number);
      const Text('empty qurie');
    } else {
      MobileNumberRespoModel? value =
          await MobileNumberServices.instance.otpverfyimg(number);
      log("dsfjonvojsvoomv${value.toString()}");

      saveToSharedPrefMobilrOtp();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MobileVerificationScreen(),
        ),
      );
    }
    notifyListeners();
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
