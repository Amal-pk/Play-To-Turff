import 'package:flutter/cupertino.dart';

class BottomNavigationBarController extends ChangeNotifier {
  int currentIndex = 0;

  int currentIndexSearch() {
    return currentIndex;
  }

  currentIndexResult(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
