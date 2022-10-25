import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:turf_app/view/core.dart';
import 'package:turf_app/view/login/login_page/model/login_model.dart';

class LoginService {
  LoginService._instans();
  static LoginService instance = LoginService._instans();
  factory LoginService() {
    return instance;
  }

  Future<LoginRespoModel?> userLogin(LoginModel value, context) async {
    try {
      Response response =
          await Dio().post(baseUrl + loginUrl, data: value.toJoson());

      if (response.statusCode == 200) {
        // print(response.data);
          ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Login successfully"),
            backgroundColor: Color.fromARGB(255, 97, 98, 97),
          ),
        );
        return LoginRespoModel.fromJson(response.data);
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
    // return LoginRespoModel.fromJson(response.data);
  }
}