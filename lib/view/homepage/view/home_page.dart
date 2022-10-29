import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:turf_app/view/core.dart';
import 'package:turf_app/view/homepage/controller/homapage_controller.dart';
import 'package:turf_app/view/homepage/controller/location_controller.dart';
import 'package:turf_app/view/homepage/view/widget/home_display.dart';
import 'package:turf_app/view/homepage/view/widget/sreach_gridview.dart';
import 'package:turf_app/view/spot/controller/sopt_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final LocationController locationController = Get.put(LocationController());
  final HomePageController nearbyController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    final SoptController controller = Provider.of<SoptController>(context);
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
                              )),
                        ),
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
                        nearbyController.isSearchClick.value = true;
                      } else {
                        nearbyController.isSearchClick.value = false;
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
                height20,
                // HomeDisplay()
                // const SearchView(),
                Obx(
                  () => AnimatedCrossFade(
                    firstChild: HomeDisplay(),
                    secondChild: const SearchView(),
                    crossFadeState: nearbyController.isSearchClick.value
                        ?( CrossFadeState.showSecond)
                        : CrossFadeState.showFirst,
                    duration: const Duration(milliseconds: 500),
                    // firstCurve: Curves.bounceOut,
                    // secondCurve: Curves.,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
