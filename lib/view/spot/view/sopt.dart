import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:turf_app/view/core.dart';
import 'package:turf_app/view/homepage/controller/homapage_controller.dart';
import 'package:turf_app/view/homepage/controller/location_controller.dart';
import 'package:turf_app/view/homepage/view/widget/sreach_gridview.dart';
import 'package:turf_app/view/spot/view/all_turff_display.dart';
import 'package:turf_app/view/spot/controller/sopt_controller.dart';

class Spot extends StatelessWidget {
  Spot({super.key});
  final LocationController locationController = Get.put(LocationController());
  // final HomePageController nearbyController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    final HomePageController nearbyController =
        Provider.of<HomePageController>(context);

    final SoptController controller =
        Provider.of<SoptController>(context, listen: false);
    // WidgetsBinding.instance.addPostFrameCallback(((timeStamp) {
    //   controller.allTruff;
    // }));
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
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
                        Consumer<HomePageController>(
                            builder: (context, value, _) {
                          return Text(
                              ' ${locationController.currentAddress.value}',
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ));
                        }),
                      ],
                    ),
                    const Icon(Icons.notifications)
                  ],
                ),
                height10,
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.only(left: 16),
                  child: TextFormField(
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        nearbyController.isSearchClick = true;
                      } else {
                        nearbyController.isSearchClick = false;
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
                Consumer<HomePageController>(builder: (context, value, _) {
                  return AnimatedCrossFade(
                    firstChild: const AllTruffDisplay(),
                    secondChild: const SearchView(),
                    crossFadeState: nearbyController.isSearchClick
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    duration: const Duration(milliseconds: 300),
                    // firstCurve: Curves.bounceOut,
                    // secondCurve: Curves.,
                  );
                }),
                height20,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
