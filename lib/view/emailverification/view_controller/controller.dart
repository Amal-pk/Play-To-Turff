import 'package:flutter/material.dart';
import 'package:turf_app/view/emailverification/model/model.dart';
import 'package:turf_app/view/emailverification/service/sevices.dart';
import 'package:turf_app/view/homepage/view/home_page.dart';


class EmailVerificationController extends ChangeNotifier {
  final emailEditingController = TextEditingController();

  verifyEmailOtp(context) async {
    print('hellooo');

    final emailOtp = emailEditingController.text.trim();
    if (emailOtp.isEmpty) {
      const Text('empty qurie');
    } else {
      SignupEmailVerifyModel value = SignupEmailVerifyModel(userOtp: emailOtp);
      SignupEmailVerifyModel result =
          await EmailVerficationService.emailVerifying(value.tojson());
      print(result.status.toString());

      if (result.status != false) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        print(result.status);
        print(result.message);
      }
    }
  }
}
