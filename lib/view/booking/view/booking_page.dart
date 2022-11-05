import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';
import 'package:provider/provider.dart';
import 'package:turf_app/view/booking/controller/controller.dart';
import 'package:turf_app/view/booking/view/widgets/session_solt.dart';
import 'package:turf_app/view/core.dart';
import 'package:turf_app/view/homepage/model/nearbymodel/datum_model.dart';

class BookingPage extends StatelessWidget {
  BookingPage({super.key, required this.bookingDetails});

  final Datum bookingDetails;
  late final List<String> imagUrL = [
    bookingDetails.turfImages!.turfImages1!,
    bookingDetails.turfImages!.turfImages2!,
    bookingDetails.turfImages!.turfImages3!
  ];
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<BookinController>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (() {
            Navigator.of(context).pop();
            controller.close();
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
        child: SingleChildScrollView(
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
                    Image.asset(
                        "asset/image/download__2_-removebg-preview.png"),
                    const Text(
                      "7's",
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
              height10,
              HorizontalCalendar(
                date: DateTime.now().add(const Duration(days: 0)),
                initialDate: DateTime.now().subtract(const Duration(days: 0)),
                textColor: Colors.black,
                backgroundColor: Colors.white,
                selectedColor: Colors.green,
                showMonth: true,
                onDateSelected: (date) {
                  if (kDebugMode) {
                    print(date.toString());
                  }
                },
              ),
              height20,
              SessionSolt(
                solt: bookingDetails,
              ),
              const SizedBox(
                height: 100,
                width: double.infinity,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 16),
        child: FloatingActionButton.extended(
          onPressed: (() {}),
          label:const Text(
            "BOOK NOW",
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
      padding: const EdgeInsets.all(10),
      // height: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
        ),
      ),
    );
