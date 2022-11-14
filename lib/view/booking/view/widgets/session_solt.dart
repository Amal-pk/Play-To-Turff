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
                        color: controller.morning ? Colors.yellow : Colors.grey,
                      ),
                      Text(
                        "Morning",
                        style: TextStyle(
                          color:
                              controller.morning ? Colors.black : Colors.grey,
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
                      color: controller.afternoon ? Colors.amber : Colors.grey,
                    ),
                    Text(
                      "Afternoon",
                      style: TextStyle(
                        color:
                            controller.afternoon ? Colors.black : Colors.grey,
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
                      color: controller.evening ? Colors.blueGrey : Colors.grey,
                    ),
                    Text(
                      "Evening",
                      style: TextStyle(
                        color: controller.evening ? Colors.black : Colors.grey,
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
          cash: solt.turfPrice!.morningPrice!,
          controller: controller.morning,
          alltimes: controller.morningTime,
          heading: 'Morning',
        ),
        TimeSlot(
          cash: solt.turfPrice!.afternoonPrice!,
          controller: controller.afternoon,
          alltimes: controller.afternoonTime,
          heading: 'Afternoon',
        ),
        TimeSlot(
          cash: solt.turfPrice!.eveningPrice!,
          controller: controller.evening,
          alltimes: controller.eveningTime,
          heading: 'Evening',
        ),
      ],
    );
  }
}
