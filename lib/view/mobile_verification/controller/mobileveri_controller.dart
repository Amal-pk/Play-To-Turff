import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turf_app/view/homepage/view/home_page.dart';
import 'package:turf_app/view/mobile_verification/model/mobile_ver_model.dart';
import 'package:turf_app/view/mobile_verification/service/mobile_veri_service.dart';
import 'package:turf_app/view/mobilenumber/controller/controller.dart';
import 'package:turf_app/view/mobilenumber/model/model.dart';

class MobileVerificationController extends ChangeNotifier {
  final phoneEditingController = TextEditingController();

  MobileOtpController controller = MobileOtpController();

  verifyMobileOtp(context) async {
    print('hellooo');

    final mobileOtp = phoneEditingController.text.trim();
    if (mobileOtp.isEmpty) {
      const Text('empty qurie');
    } else {
      MobileVerificationResponseModel value = MobileVerificationResponseModel(
          otp: mobileOtp,
          id: controller.mobileId,
          number: controller.mobileNumberTextfield.text);
      MobileVerificationResponseModel result =
          await MobileVerificationServices.otpVerfy(value.tojson());
      print(result.number.toString());

      if (result.status != false) {
        Navigator.push(                
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      } else {
        print(result.status);
        print(result.id);
      }
    }
  }
}
