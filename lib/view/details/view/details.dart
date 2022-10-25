import 'dart:developer';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:turf_app/view/core.dart';
import 'package:turf_app/view/details/controller/details_controller.dart';
import 'package:turf_app/view/details/view/widgets/amenities.dart';
import 'package:turf_app/view/details/view/widgets/price.dart';
import 'package:turf_app/view/homepage/model/nearbymodel/datum_model.dart';

class Details extends StatelessWidget {
  Details({super.key, required this.details});
  final Datum details;
  late final List<String> imagUrL = [
    details.turfImages!.turfImages1!,
    details.turfImages!.turfImages2!,
    details.turfImages!.turfImages3!
  ];
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<DetailsController>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: (() {
            controller.priceOnTap = false;
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    Image.asset(
                        "asset/image/download__2_-removebg-preview.png"),
                    const Text(
                      "7\'s",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Image.asset(
                        "asset/image/download__2_-removebg-preview.png"),
                  ],
                ),
              ),
              height20,
              CarouselSlider.builder(
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  final imagurl = imagUrL[index];
                  return buildImage(imagurl, index);
                },
                itemCount: imagUrL.length,
                options: CarouselOptions(
                  autoPlayInterval: const Duration(seconds: 5),
                  autoPlay: true,
                  height: 200,
                ),
              ),
              height20,
              Center(
                child: Text(
                  details.turfName.toString(),
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              height20,
              Text(
                "${details.turfPlace.toString()},${details.turfDistrict.toString()}",
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
              height20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Consumer<DetailsController>(builder: (context, value, _) {
                    return ElevatedButton(
                      onPressed: () {
                        value.priceOntap();
                      },
                      child: const Text("Price"),
                    );
                  }),
                  ElevatedButton(
                    onPressed: (() {}),
                    child: const Text("Location"),
                  )
                ],
              ),
              PriceDetailsWidget(
                detail: details,
              ),
              const Text(
                "Amenities",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              height20,
              AmenititesWidget(details: details),
              height20,
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 16.0, right: 10, left: 10),
        child: FloatingActionButton.extended(
          onPressed: (() {
            controller.booking();
          }),
          label: const Text(
            "BOOK",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          extendedPadding:
              const EdgeInsetsDirectional.only(start: 150, end: 150),
        ),
      ),
    );
  }
}

Widget buildImage(String imageUrl, int index) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 200,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(60),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
        ),
      ),
    );
