import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turf_app/view/bottom_navigation/controller/bottomnavigation_controller.dart';
import 'package:turf_app/view/homepage/view/home_page.dart';
import 'package:turf_app/view/profile/profile.dart';
import 'package:turf_app/view/sopt/view/sopt.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({super.key});
  List<dynamic> screens = [
    HomePage(),
     Spot(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    final screenindexprovider =
        Provider.of<BottomNavigationBarController>(context);
    int currentScreenIndex = screenindexprovider.currentIndexSearch();
    return Scaffold(
      body: screens[currentScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        elevation: 0,
        currentIndex: currentScreenIndex,
        onTap: (value) => screenindexprovider.currentIndexResult(value),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              (currentScreenIndex == 0)
                  ? Icons.home_rounded
                  : Icons.home_outlined,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              (currentScreenIndex == 1)
                  ? Icons.stadium_sharp
                  : Icons.stadium_outlined,
            ),
            label: 'All Turff',
          ),
          BottomNavigationBarItem(
            icon: Icon((currentScreenIndex == 2)
                ? Icons.person
                : Icons.person_outline),
            label: 'Profile',
          )
        ],
      ),
    );
  }
}


// Scaffold(
//       body: controller.pages[1],
//       extendBody: true,
//       bottomNavigationBar: Container(
//         decoration: const BoxDecoration(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(30),
//             topRight: Radius.circular(30),
//           ),
//         ),
//         child: Consumer<BottomNavigationBarController>(
//             builder: (context, value, _) {
//           return BottomNavigationBar(
//             backgroundColor: Colors.green,
//             unselectedItemColor: Colors.white,
//             selectedItemColor: Colors.black,
//             currentIndex: controller.currentIndex(controller.pages.length),
//             onTap: (value) => controller.currentIndex(value),
//             items: const [
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.home_rounded),
//                 label: 'Home',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.stadium_sharp),
//                 label: 'Spot',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.person),
//                 label: 'Profile',
//               )
//             ],
//           );
//         }),
//       ),
//     );