import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turf_app/view/emailverification/model/model.dart';
import 'package:turf_app/view/emailverification/service/sevices.dart';
import 'package:turf_app/view/homepage/view/home_page.dart';
import 'package:turf_app/view/register_page/view_controller/register_controller.dart';

class EmailVerificationController extends ChangeNotifier {
  final emailEditingController = TextEditingController();

  verifyEmailOtp(context) async {
    final emailOtp = emailEditingController.text.trim();
    if (emailOtp.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please Enter the Valid Data'),
          backgroundColor: Color.fromARGB(255, 57, 57, 57),
        ),
      );
    } else {
      final signupController =
          Provider.of<SignupController>(context, listen: false);

      SignupEmailVerifyModel value = SignupEmailVerifyModel(
          userOtp: emailOtp, id: signupController.signUpRespoModel!.id);
      SignupEmailVerifyModel result =
          await EmailVerficationService.emailVerifying(value.tojson());

      if (result.status != false) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(result.message!),
            backgroundColor: Color.fromARGB(255, 64, 65, 64)));
      }
    }
  }
}
