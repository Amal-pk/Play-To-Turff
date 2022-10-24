import 'package:get/get.dart';
import 'package:turf_app/view/homepage/view/home_page.dart';
import 'package:turf_app/view/profile/profile.dart';
import 'package:turf_app/view/sopt/sopt.dart';

class BottomNavigationBarController extends GetxController {
  RxInt currentIntex = 0.obs;
  final pages = [
    HomePage(),
    const Spot(),
    const Profile(),
  ];
}
