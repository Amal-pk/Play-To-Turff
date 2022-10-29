import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turf_app/view/core.dart';
import 'package:turf_app/view/details/view/details.dart';
import 'package:turf_app/view/homepage/controller/homapage_controller.dart';
import 'package:turf_app/view/homepage/controller/location_controller.dart';

class GridviewPage extends StatelessWidget {
  GridviewPage({super.key});
  final LocationController locationController = Get.put(LocationController());
  final HomePageController nearbyController = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    final high = MediaQuery.of(context).size.height;
    final wid = MediaQuery.of(context).size.width;

    return GetBuilder<HomePageController>(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            child: Text(
              "Near by Grounds",
              style: TextStyle(
                  fontSize: high / 35,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0),
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              // childAspectRatio: (high / 2) / (wid / 5),
            ),
            itemCount: nearbyController.near.length,
            itemBuilder: (BuildContext context, int index) {
              final turfss = nearbyController.near[index];
              return GestureDetector(
                onTap: () => Get.to(
                  () => Details(
                    details: turfss,
                  ),
                ),
                child: Container(
                  // height: high / 2,
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 3,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: high / 20,
                        child: Image(
                          // height: 80,
                          width: double.infinity,
                          image: NetworkImage(
                            turfss.turfLogo!,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      height10,
                      Text(
                        turfss.turfName!,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      height10,
                      FittedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.black,
                                  size: 16,
                                ),
                                Text(
                                  turfss.turfPlace!,
                                ),
                              ],
                            ),
                            width10,
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Text(
                                  turfss.turfInfo!.turfRating!.toString(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      );
    });
  }
}
//  