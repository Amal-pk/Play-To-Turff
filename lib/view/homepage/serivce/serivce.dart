import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:turf_app/view/core.dart';
import 'package:turf_app/view/homepage/model/nearbymodel/nearbymoel.dart';

class NearbyService {
  NearbyService._instans();
  static NearbyService instance = NearbyService._instans();
  factory NearbyService() {
    return instance;
  }
  Future<HomeResponse?> nearbyTurf(String place, String token) async {
    try {
      Response response = await Dio().get(
        baseUrl + nearbyUrl + place,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      return HomeResponse.fromJson(response.data);
    } catch (e) {
      // ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Error Founded'),
        backgroundColor: Color.fromARGB(255, 47, 48, 47),
      );
      // );
    }
  }
}
