import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:turf_app/error_handling_function/error_handling_function.dart';

import 'package:turf_app/view/core.dart';
import 'package:turf_app/view/login/mobilenumber/model/model.dart';

class MobileNumberServices {
  MobileNumberServices._internal();
  static MobileNumberServices instance = MobileNumberServices._internal();
  factory MobileNumberServices() {
    return instance;
  }
  ErrorCode errorCode = ErrorCode();
  Future<MobileNumberRespoModel?> otpverfyimg(dynamic value) async {
    try {
      Response response = await Dio().post(
        baseUrl + mobileUrl,
        data: value.tojson(),
      );
      if (response.statusCode == 200) {
        return MobileNumberRespoModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      return errorCode.status401(e);
    } catch (e) {
      SnackBar(
        content: Text('Error Founded: $e'),
        backgroundColor: const Color.fromARGB(255, 47, 48, 47),
      );
    }
  }
}
