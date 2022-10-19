import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:turf_app/view/core.dart';
import 'package:turf_app/view/homepage/controller/homapage_controller.dart';
import 'package:turf_app/view/homepage/controller/location_controller.dart';
import 'package:turf_app/view/homepage/view/widget/gridview.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final LocationController locationController = Get.put(LocationController());
  @override
  Widget build(BuildContext context) {
    // final controller = Provider.of<HomePageController>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
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
                              style: const TextStyle(fontSize: 18)),
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
                    decoration: const InputDecoration(
                      hintText: 'Search',
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                height20,
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Hai, Amal ",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Explore vanues and \n book your favourite \nspot... ",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        "asset/image/images.jpg",
                        height: 120,
                        width: 150,
                      ),
                    ],
                  ),
                ),
                height10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Near by Grounds",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "veiw all",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                const GridviewPage()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
