import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:turf_app/error_handling_function/error_handling_function.dart';
import 'package:turf_app/view/booking/model/booking_model.dart';
import 'package:turf_app/view/core.dart';

class BookingService {
  BookingService._instans();
  static BookingService instance = BookingService._instans();
  factory BookingService() {
    return instance;
  }
  ErrorCode errorCode = ErrorCode();
  Future<GetAllTurfTimeSlot?> book(String turfId) async {
    try {
      Response response = await Dio().get(baseUrl + getBookingUrl + turfId);
      if (response.statusCode == 200) {
        // print(response.data);
        const SnackBar(
          content: Text("Login successfully"),
          backgroundColor: Color.fromARGB(255, 97, 98, 97),
        );
        return GetAllTurfTimeSlot.fromJson(response.data);
      }
    } on DioError catch (e) {
      return errorCode.status401(e);
    } catch (e) {
      const SnackBar(
        content: Text('Error Founded'),
        backgroundColor: Color.fromARGB(255, 47, 48, 47),
      );
    }
    return null;
  }
}
