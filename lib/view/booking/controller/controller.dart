import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:turf_app/view/homepage/model/nearbymodel/datum_model.dart';

class BookinController extends ChangeNotifier {
  bool morning = false;
  bool afternoon = false;
  bool evening = false;

  List<int> times = [];
  List morningTime = [];
  List afternoonTime = [];
  List eveningTime = [];
  List selectedTime = [];

  void isMorning() {
    morning = !morning;
    afternoon = false;
    evening = false;
    notifyListeners();
  }

  void isAfternoon() {
    afternoon = !afternoon;
    evening = false;
    morning = false;
    notifyListeners();
  }

  void isEvening() {
    evening = !evening;
    afternoon = false;
    morning = false;
    notifyListeners();
  }

  void close() {
    morning = true;
    afternoon = false;
    evening = false;
  }

  void dayTime() {
    var hr = DateTime.now().hour;
    if (hr < 12) {
      morning = true;
      evening = false;
      afternoon = false;
    } else if (hr <= 16) {
      afternoon = true;
      morning = false;
      evening = false;
    } else {
      evening = true;
      morning = false;
      afternoon = false;
    }
    notifyListeners();
  }

  timing(Datum time) {
    times.clear();
    times.addAll([
      time.turfTime!.timeMorningStart!,
      time.turfTime!.timeMorningEnd!,
      time.turfTime!.timeAfternoonStart!,
      time.turfTime!.timeAfternoonEnd!,
      time.turfTime!.timeEveningStart!,
      time.turfTime!.timeEveningEnd!
    ]);
    for (int i = 0; i < times.length; i++) {
      if (times[i] > 12) {
        times[i] = times[i] - 12;
      }
    }
  }

  bookingDayTime(int start, int end, List alltimes) {
    alltimes.clear();
    for (int i = start; i < end; i++) {
      alltimes.add("${i.toString()}:00 - ${(i + 1).toString()}:00");
    }
  }

  selectedTimes(int value, list) {
    if (selectedTime.contains(list[value])) {
      selectedTime.remove(list[value]);
    } else {
      selectedTime.add(list[value]);
    }
    notifyListeners();
  }
}
