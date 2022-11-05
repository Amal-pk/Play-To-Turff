import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:turf_app/view/homepage/model/nearbymodel/nearbymoel.dart';
import 'package:turf_app/view/login/login_page/model/login_model.dart';

class ErrorCode {
  success(dynamic response) {
    if (response.statusCode == 200) {
      // print(response.data);
      // log(response.toString());
      const SnackBar(
        content: Text("Login successfully"),
        backgroundColor: Color.fromARGB(255, 97, 98, 97),
      );
      return LoginRespoModel.fromJson(response.data);
    }
  }

  status401(e) {
    if (e.response?.statusCode == 401) {
      const SnackBar(
        content: Text('Server Not Founded'),
        backgroundColor: Color.fromARGB(255, 97, 98, 97),
      );
    } else if (e.type == DioErrorType.connectTimeout) {
      const SnackBar(
        content: Text('Connection Time out'),
      );
    } else if (e.type == DioErrorType.receiveTimeout) {
      const SnackBar(
        content: Text('Timeout Error'),
      );
    } else if (e.type == DioErrorType.other) {
      const SnackBar(
        content: Text('Network Error'),
      );
    }
  }

  nearBy(dynamic response) {
    if (response.statusCode == 200) {
      // print(response.data);
      const SnackBar(
        content: Text("Login successfully"),
        backgroundColor: Color.fromARGB(255, 97, 98, 97),
      );
      return HomeResponse.fromJson(response.data);
    }
  }
}
