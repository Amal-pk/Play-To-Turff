import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:turf_app/view/booking/view/booking_page.dart';

class DetailsController extends ChangeNotifier {
  bool priceOnTap = false;

  void booking() {
    Get.to(() => const BookingPage());
    notifyListeners();
  }

  void priceOntap() {
    priceOnTap = !priceOnTap;
    log(priceOnTap.toString());
    notifyListeners();
  }

  @override
  void dispose() {
    priceOnTap = false;
    log("++++++++++++++++++++");
    super.dispose();
  }
}

