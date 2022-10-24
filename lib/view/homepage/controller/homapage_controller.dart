import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turf_app/view/homepage/controller/location_controller.dart';
import 'package:turf_app/view/homepage/model/nearbymodel/datum_model.dart';
import 'package:turf_app/view/homepage/model/nearbymodel/nearbymoel.dart';
import 'package:turf_app/view/homepage/serivce/serivce.dart';

class HomePageController extends GetxController {
  final LocationController controller = Get.put(LocationController());

  List<Datum> near = [];
  // String district = '';

  nearbyTruff() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    final token = sp.getString("Token");
    log(token.toString());
    // final place = controller.currentAddress.value;
    HomeResponse? nearbyResponse =
        await NearbyService.instance.nearbyTurf("Malappuram", token!);
    log(controller.district.toString());
    if (nearbyResponse != null && nearbyResponse.status == true) {
      near.clear();

      near.addAll(nearbyResponse.data!);
    }
  }
}
