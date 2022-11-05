import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:turf_app/error_handling_function/error_handling_function.dart';
import 'package:turf_app/view/core.dart';
import 'package:turf_app/view/homepage/model/nearbymodel/nearbymoel.dart';

class AllTurfService {
  AllTurfService._instans();
  static AllTurfService instance = AllTurfService._instans();
  factory AllTurfService() {
    return instance;
  }
  ErrorCode errorCode = ErrorCode();
  Future<HomeResponse?> allTurf(String token) async {
    try {
      Response response = await Dio().get(
        baseUrl + allTurfUrl,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      return HomeResponse.fromJson(response.data);
    } on DioError catch (e) {
      return errorCode.status401(e);
    } catch (e) {
      const SnackBar(
        content: Text('Error Founded'),
        backgroundColor: Color.fromARGB(255, 47, 48, 47),
      );
    }
  }
}
