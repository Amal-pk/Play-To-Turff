import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turf_app/view/mobilenumber/model/model.dart';
import 'package:turf_app/view/mobilenumber/service/service.dart';
import 'package:turf_app/view/mobilenumber/view/verification/mobileverification.dart';

class MobileOtpController extends ChangeNotifier {
  final mobileNumberTextfield = TextEditingController();

  loginMobileOtp(context) {
    final mobileVerificationServiceProvider = MobileVerificationServices();

    final number = mobileNumberTextfield.text.trim();

    if (number.isEmpty) {
      const Text('empty qurie');
    } else {
      MobileVerificationModel value = MobileVerificationModel(
        number: number,
      );
      mobileVerificationServiceProvider.otpverfyimg(value.tojson());
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
        'mobilenumber', mobileNumberTextfield.text.trim());
  }
}
