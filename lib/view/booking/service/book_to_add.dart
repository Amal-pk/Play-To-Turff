import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:turf_app/error_handling_function/error_handling_function.dart';
import 'package:turf_app/view/booking/model/booking_model.dart';
import 'package:turf_app/view/core.dart';

class BookingServiceAdd {
  BookingServiceAdd._instans();
  static BookingServiceAdd instance = BookingServiceAdd._instans();
  factory BookingServiceAdd() {
    return instance;
  }
  ErrorCode errorCode = ErrorCode();
  Future<bool> book(value) async {
    try {
      Response response =
          await Dio().post(baseUrl + addBookingUrl, data: value.toJson());
      if (response.statusCode == 200) {
        // print(response.data);
        log("service${response.data}");
        return true;
      }
    } on DioError catch (e) {
      return errorCode.status401(e);
    } catch (e) {
      const SnackBar(
        content: Text('Error Founded'),
        backgroundColor: Color.fromARGB(255, 47, 48, 47),
      );
    }
    return false;
  }
}
