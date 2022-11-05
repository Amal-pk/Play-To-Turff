import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turf_app/view/booking/controller/controller.dart';
import 'package:turf_app/view/booking/view/widgets/time_slot.dart';
import 'package:turf_app/view/core.dart';
import 'package:turf_app/view/homepage/model/nearbymodel/datum_model.dart';

class SessionSolt extends StatelessWidget {
  const SessionSolt({super.key, required this.solt});
  final Datum solt;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<BookinController>(context);
    return Column(
      children: [
        const Divider(
          thickness: 2,
          color: Color.fromARGB(255, 229, 226, 226),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Consumer<BookinController>(builder: (context, value, _) {
                return TextButton(
                  onPressed: (() {
                    controller.isMorning();
                  }),
                  child: Row(
                    children: [
                      Icon(
                        Icons.sunny,
                        color: controller.morning ? Colors.grey : Colors.yellow,
                      ),
                      Text(
                        "Morning",
                        style: TextStyle(
                          color:
                              controller.morning ? Colors.grey : Colors.black,
                        ),
                      ),
                    ],
                  ),
                );
              }),
              TextButton(
                onPressed: (() {
                  controller.isAfternoon();
                }),
                child: Row(
                  children: [
                    Icon(
                      Icons.wb_sunny,
                      color: controller.afternoon ? Colors.grey : Colors.amber,
                    ),
                    Text(
                      "Afternoon",
                      style: TextStyle(
                        color:
                            controller.afternoon ? Colors.grey : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: (() {
                  controller.isEvening();
                }),
                child: Row(
                  children: [
                    Icon(
                      Icons.nights_stay,
                      color: controller.evening ? Colors.grey : Colors.blueGrey,
                    ),
                    Text(
                      "Evening",
                      style: TextStyle(
                        color: controller.evening ? Colors.grey : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 2,
          color: Colors.green,
        ),
        height10,
        TimeSlot(
          cash: solt,
          controller: controller.morning,
          day: solt.turfPrice!.morningPrice.toString(),
          alltimes: controller.morningTime,
        ),
        TimeSlot(
          cash: solt,
          controller: controller.afternoon,
          day: solt.turfPrice!.afternoonPrice.toString(),
          alltimes: controller.afternoonTime,
        ),
        TimeSlot(
          cash: solt,
          controller: controller.evening,
          day: solt.turfPrice!.eveningPrice.toString(),
          alltimes: controller.eveningTime,
        ),
      ],
    );
  }
}
