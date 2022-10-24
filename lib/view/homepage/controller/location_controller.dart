import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  // final HomePageController controller = Get.put(HomePageController());
  dynamic currentPosition = ''.obs;
  Rx<String> currentAddress = ''.obs;
  String district = '';
  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services'));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        const SnackBar(content: Text('Location permissions are denied'));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.'));
      return false;
    }
    return true;
  }

  Future<void> getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      currentPosition = position;
      _getAddressFromLatLng(currentPosition);
    }).catchError((e) {
      log(e.toString());
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
      currentPosition!.latitude,
      currentPosition!.longitude,
    ).then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      currentAddress.value =
          '${place.subLocality}, ${place.subAdministrativeArea}';
      district = place.subAdministrativeArea!.toString();
      // log(place.subAdministrativeArea.toString());
    }).catchError((e) {
      log(e.toString());
    });
  }
}
