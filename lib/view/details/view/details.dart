import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turf_app/view/core.dart';
import 'package:turf_app/view/homepage/model/nearbymodel/datum_model.dart';

class Details extends StatelessWidget {
  const Details({super.key, required this.details});
  final Datum details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: (() {
            Get.back();
          }),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Details',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: (() {}),
                icon: const Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.black,
                )),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            height10,
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.green,
              ),
              height: 60,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("asset/image/download__2_-removebg-preview.png"),
                  const Text(
                    "7\'s",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.asset("asset/image/download__2_-removebg-preview.png"),
                ],
              ),
            ),
            height20,
            Image(
              image: NetworkImage(details.turfImages!.turfImages2!),
            ),
            Center(
              child: Text(
                details.turfName.toString(),
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  details.turfPlace.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const Text(
                  ',',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  details.turfDistrict.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                )
              ],
            ),
            height20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(onPressed: (() {}), child: const Text("Price")),
                ElevatedButton(
                    onPressed: (() {}), child: const Text("Location"))
              ],
            ),
            const Text(
              "Amenities",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
