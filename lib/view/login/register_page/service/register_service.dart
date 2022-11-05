import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:turf_app/error_handling_function/error_handling_function.dart';
import 'package:turf_app/view/core.dart';
import 'package:turf_app/view/login/register_page/model/register_model.dart';

class SignupService {
  SignupService._internal();
  static SignupService instance = SignupService._internal();
  factory SignupService() {
    return instance;
  }
  ErrorCode errorCode = ErrorCode();
  Future<SignUpRespoModel?> signupUser(SignUpModel value, context) async {
    try {
      Response response = await Dio().post(
        baseUrl + registerUrl,
        data: value.tojson(),
      );
      print(response);

      if (response.statusCode == 200) {
        return SignUpRespoModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      return errorCode.status401(e);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error Founded: $e'),
          backgroundColor: const Color.fromARGB(255, 47, 48, 47),
        ),
      );
    }
  }
}
