import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:turf_app/view/core.dart';
import 'package:turf_app/view/details/controller/details_controller.dart';
import 'package:turf_app/view/details/view/details.dart';
import 'package:turf_app/view/homepage/controller/homapage_controller.dart';
import 'package:turf_app/view/homepage/controller/location_controller.dart';

class GridviewPage extends StatelessWidget {
  GridviewPage({super.key});
  final LocationController locationController = Get.put(LocationController());
  // final HomePageController nearbyController = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    final high = MediaQuery.of(context).size.height;
    final wid = MediaQuery.of(context).size.width;
    final HomePageController homePageController =
        Provider.of<HomePageController>(context);
    final itemHigh = (high - kToolbarHeight - 24) / 3.4;
    final itemWidth = wid / 2;
    return Consumer<HomePageController>(builder: (context, value, _) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FittedBox(
                child: Text(
                  "Near by Grounds",
                  style: TextStyle(
                    fontSize: high / 35,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0,
                  ),
                ),
              ),
              Consumer<DetailsController>(
                builder: (context, value, _) {
                  return TextButton(
                    onPressed: (() {
                      value.allTurfView();
                    }),
                    child: const Text(
                      "veiw all",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: (itemWidth / itemHigh),
            ),
            itemCount: homePageController.near.length,
            itemBuilder: (BuildContext context, int index) {
              final turfss = homePageController.near[index];
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
                      height10,
                      CircleAvatar(
                        radius: high / 22,
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
                      FittedBox(
                        child: Text(
                          turfss.turfName!,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
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