import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turf_app/view/bottom_navigation/controller/bottomnavigation_controller.dart';
import 'package:turf_app/view/homepage/controller/location_controller.dart';
import 'package:turf_app/view/homepage/model/nearbymodel/datum_model.dart';
import 'package:turf_app/view/homepage/model/nearbymodel/nearbymoel.dart';
import 'package:turf_app/view/homepage/serivce/serivce.dart';
import 'package:turf_app/view/login/login_page/view/login_page.dart';

class HomePageController extends ChangeNotifier {
  final LocationController controller = Get.put(LocationController());

  List<Datum> near = [];
  bool isSearchClick = false;
  bool isLoading = false;

  nearbyTruff() async {
    isLoading = true;
    SharedPreferences sp = await SharedPreferences.getInstance();
    final token = sp.getString("Token");
    // log(token.toString());
    final place = controller.district;
    log("+++++++++++++++++++++++++++++++${place.toString()}");
    HomeResponse? nearbyResponse =
        await NearbyService.instance.nearbyTurf("Malappuram", token!);
    log(controller.district.toString());
    if (nearbyResponse != null && nearbyResponse.status == true) {
      near.clear();
      near.addAll(nearbyResponse.data!);
    }

    isLoading = false;
    notifyListeners();
  }

  logOut(context) async {
    SharedPreferences lot = await SharedPreferences.getInstance();
    lot.remove("Token");
    lot.remove("email");
    lot.remove("password");
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LoginPage()),
        (Route<dynamic> route) => false);
    notifyListeners();
  }
}
