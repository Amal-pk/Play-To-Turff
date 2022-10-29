import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:turf_app/view/booking/view/booking_page.dart';

class DetailsController extends ChangeNotifier {
  bool priceOnTap = false;

  bool allTurffView = false;

  // void booking() {
  //   notifyListeners();
  // }

  void priceOntap() {
    priceOnTap = !priceOnTap;
    log(priceOnTap.toString());
    notifyListeners();
  }

  void allTurfView() {
    allTurffView = !allTurffView;
    log(allTurffView.toString());
    notifyListeners();
  }

  @override
  void dispose() {
    priceOnTap = false;
    log("++++++++++++++++++++");
    super.dispose();
  }
}
