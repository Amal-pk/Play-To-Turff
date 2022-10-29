import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:turf_app/view/homepage/model/nearbymodel/datum_model.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key, required this.bookingDetails});
  final Datum bookingDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (() {
            Navigator.of(context).pop();
          }),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Booking",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(8),
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
                    "7's",
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
            Image(
              image: NetworkImage(
                bookingDetails.turfImages!.turfImages1!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
