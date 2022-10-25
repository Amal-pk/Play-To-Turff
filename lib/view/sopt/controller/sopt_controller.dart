import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turf_app/view/homepage/model/nearbymodel/datum_model.dart';
import 'package:turf_app/view/homepage/model/nearbymodel/nearbymoel.dart';
import 'package:turf_app/view/sopt/serivce/sopt_service.dart';

class SoptController extends ChangeNotifier {
  List<Datum> allTruff = [];

  oninit() async {
    await allTurff();
  }

  allTurff() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    final token = sp.getString("Token");
    log(token.toString());

    HomeResponse? allTruffRespo = await AllTurfService.instance.allTurf(token!);
    if (allTruffRespo != null && allTruffRespo.status == true) {
      allTruff.clear();
      allTruff.addAll(allTruffRespo.data!);
    }
  }
}
