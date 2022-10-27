import 'package:flutter/cupertino.dart';
import 'package:turf_app/view/homepage/view/home_page.dart';
import 'package:turf_app/view/profile/profile.dart';
import 'package:turf_app/view/sopt/view/sopt.dart';

class BottomNavigationBarController extends ChangeNotifier {
  int currentIndex = 0;

  // final pages = [
  //   HomePage(),
  //   const Spot(),
  //   Profile(),
  // ];

  int currentIndexSearch() {
    return currentIndex;
  }

  currentIndexResult(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
