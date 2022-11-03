import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turf_app/view/booking/controller/controller.dart';
import 'package:turf_app/view/booking/view/widgets/times.dart';
import 'package:turf_app/view/homepage/model/nearbymodel/datum_model.dart';

class TimeSlot extends StatelessWidget {
  const TimeSlot(
      {super.key,
      required this.cash,
      required this.day,
      required this.controller});
  final Datum cash;
  final day;
  final controller;
  @override
  Widget build(BuildContext context) {
    // BookinController controller = context.read<BookinController>();
    return Consumer<BookinController>(builder: (context, value, _) {
      return AnimatedContainer(
        duration: const Duration(seconds: 1),
        width: controller ? 500 : 0,
        height: controller ? 200 : 0,
        alignment:
            controller ? Alignment.centerRight : AlignmentDirectional.center,
        color: Colors.white,
        curve: Curves.fastOutSlowIn,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            Wrap(
              children: [
                FittedBox(
                  child: Text(
                    day,
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                const Divider(
                  thickness: 1,
                ),
              ],
            ),
            Wrap(
              children: List.generate(
                5,
                ((index) => Times(
                      time: cash,
                    )),
              ),
            )
          ],
        ),
      );
    });
  }
}
