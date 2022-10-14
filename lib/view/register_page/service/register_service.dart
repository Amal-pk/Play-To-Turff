import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:turf_app/view/core.dart';
import 'package:turf_app/view/register_page/model/register_model.dart';

class SignupService {
  SignupService._internal();
  static SignupService instance = SignupService._internal();
  factory SignupService() {
    return instance; 
  }

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
      if (e.response?.statusCode == 401) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Server Not Founded'),
            backgroundColor: Color.fromARGB(255, 97, 98, 97),
          ),
        );
      } else if (e.type == DioErrorType.connectTimeout) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Connection Time out'),
          ),
        );
      } else if (e.type == DioErrorType.receiveTimeout) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Timeout Error'),
          ),
        );
      } else if (e.type == DioErrorType.other) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Network Error'),
          ),
        );
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error Founded: $e'),
          backgroundColor: const Color.fromARGB(255, 73, 73, 73),
        ),
      );
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
