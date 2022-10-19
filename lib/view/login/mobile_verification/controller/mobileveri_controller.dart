import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turf_app/view/homepage/view/home_page.dart';
import 'package:turf_app/view/login/mobile_verification/model/mobile_ver_model.dart';
import 'package:turf_app/view/login/mobile_verification/service/mobile_veri_service.dart';
import 'package:turf_app/view/login/mobilenumber/controller/controller.dart';

class MobileVerificationController extends ChangeNotifier {
  final phoneEditingController = TextEditingController();

  MobileOtpController controller = MobileOtpController();

  verifyMobileOtp(context) async {
    print('hellooo');

    final mobileOtp = phoneEditingController.text.trim();
    if (mobileOtp.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please Enter the Valid Data'),
          backgroundColor: Color.fromARGB(255, 57, 57, 57),
        ),
      );
    } else {
      final moblieController =
          Provider.of<MobileOtpController>(context, listen: false);

      MobileVerificationResponseModel value = MobileVerificationResponseModel(
          otp: mobileOtp,
          id: moblieController.mobileId!.id,
          number: controller.mobileNumberTextfield.text);
      MobileVerificationResponseModel result =
          await MobileVerificationServices.otpVerfy(value.tojson());
      print(result.number.toString());

      if (result.status != false) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  HomePage(),
          ),
        );
      } else {
        print(result.status);
        print(result.id);
      }
    }
  }
}
