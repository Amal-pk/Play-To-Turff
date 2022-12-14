import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:turf_app/view/core.dart';
import 'package:turf_app/view/homepage/controller/homapage_controller.dart';
import 'package:turf_app/view/homepage/controller/location_controller.dart';
import 'package:turf_app/view/homepage/view/widget/home_display.dart';
import 'package:turf_app/view/homepage/view/widget/search.dart';
import 'package:turf_app/view/homepage/view/widget/sreach_gridview.dart';
import 'package:turf_app/view/spot/controller/sopt_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final LocationController locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    final HomePageController homePageController =
        Provider.of<HomePageController>(context);
    final SoptController controller = Provider.of<SoptController>(context);
    // WidgetsBinding.instance.addPostFrameCallback(((timeStamp) {
    //   homePageController.nearbyTruff();
    // }));
    WidgetsBinding.instance.addPostFrameCallback(((timeStamp) {
      controller.oninit();
    }));
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 18,
                        ),
                        Obx(
                          () => Text(
                            ' ${locationController.currentAddress.value}',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                height10,
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.only(left: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const Search()),
                          ),
                        );
                      },
                      child: TextFormField(
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            homePageController.isSearchClick = true;
                          } else {
                            homePageController.isSearchClick = false;
                          }
                          controller.search(value);
                        },
                        decoration: const InputDecoration(
                          hintText: 'Search',
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                  ),
                ),
                height20,
                // HomeDisplay(),
                // const SearchView(),
                Consumer<HomePageController>(builder: (context, value, _) {
                  return AnimatedCrossFade(
                    firstChild: const HomeDisplay(),
                    secondChild: const SearchView(),
                    crossFadeState: homePageController.isSearchClick
                        ? (CrossFadeState.showSecond)
                        : CrossFadeState.showFirst,
                    duration: const Duration(milliseconds: 300),
                    firstCurve: Curves.fastOutSlowIn,
                    secondCurve: Curves.fastLinearToSlowEaseIn,
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
