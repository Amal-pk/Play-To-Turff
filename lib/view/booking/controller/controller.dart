import 'package:flutter/cupertino.dart';

class BookinController extends ChangeNotifier {
  bool morning = false;
  bool afternoon = false;
  bool evening = false;

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
}
