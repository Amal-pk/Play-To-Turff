import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turf_app/view/core.dart';
import 'package:turf_app/error_handling_function/error_handling_function.dart';
import 'package:turf_app/view/homepage/model/nearbymodel/nearbymoel.dart';

class NearbyService {
  NearbyService._instans();
  static NearbyService instance = NearbyService._instans();
  factory NearbyService() {
    return instance;
  }
  ErrorCode errorCode = ErrorCode();
  
  Future<HomeResponse?> nearbyTurf(String place, String token) async {
    try {
      Response response = await Dio().get(
        baseUrl + nearbyUrl + place,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      return errorCode.nearBy(response);
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
