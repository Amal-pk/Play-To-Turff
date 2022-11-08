import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turf_app/view/homepage/model/nearbymodel/datum_model.dart';

class BookinController extends ChangeNotifier {
  bool morning = false;
  bool afternoon = false;
  bool evening = false;
  bool expiare = false;

  late int selectedDate;

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

  bookingDayTime(int start, int end, List alltimes, String space) {
    alltimes.clear();
    for (int i = start; i < end; i++) {
      alltimes.add("$space${i.toString()}:00 - ${(i + 1).toString()}:00$space");
    }
  }

  selectedTimes({
    required String time,
    required String key,
  }) {
    var timeList;

    if (key == "Morning") {
      timeList = int.parse(time.trim().split(":").first);
    } else {
      timeList = int.parse(time.trim().split(":").first) + 12;
    }
    if (selectedDate == DateTime.now().day) {
      if (selectedTime.contains(time)) {
        if (timeList > DateTime.now().hour) {
          selectedTime.remove(time);
        } else {
          log('time not available 555');

          const SnackBar(
            content: Text('Server Not Founded'),
            backgroundColor: Color.fromARGB(255, 97, 98, 97),
          );
        }
      } else {
        if (timeList > DateTime.now().hour) {
          selectedTime.add(time);
        } else {
          log('time not available 333');
          const SnackBar(
            content: Text('Server Not Founded'),
            backgroundColor: Color.fromARGB(255, 97, 98, 97),
          );
        }
      }
    } else {
      if (selectedTime.contains(time)) {
        selectedTime.remove(time);
      } else {
        selectedTime.add(time);
      }
    }
    log(time.toString());
    log(selectedTime.toString());
    notifyListeners();
  }

  bool isAvailableCheckFunction({
    required String item,
    required String heading,
  }) {
    var temp = item.trim();
    var splittedtime = temp.split(':').first;
    var parsedTime = int.parse(splittedtime);
    var finalTime = 0;
    if (heading != 'Morning') {
      finalTime = parsedTime + 12;
    } else {
      finalTime = parsedTime;
    }
    return DateTime.now().hour >= finalTime &&
        selectedDate == DateTime.now().day;
  }

  selectDate(data) {
    selectedDate = int.parse(data.toString().split("-").last);
    log(selectedDate.toString());
    selectedTime.clear();
    notifyListeners();
  }
}
// ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     content: const Text('Awesome SnackBar!'),
        //     duration: const Duration(milliseconds: 1500),
        //     width: 280.0, // Width of the SnackBar.
        //     padding: const EdgeInsets.symmetric(
        //       horizontal: 8.0, // Inner padding for SnackBar content.
        //     ),
        //     behavior: SnackBarBehavior.floating,
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(10.0),
        //     ),
        //   ),
        // );