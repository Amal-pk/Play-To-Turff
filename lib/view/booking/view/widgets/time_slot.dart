import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turf_app/view/booking/controller/controller.dart';
import 'package:turf_app/view/booking/view/widgets/times.dart';
import 'package:turf_app/view/homepage/model/nearbymodel/datum_model.dart';

// ignore: must_be_immutable
class TimeSlot extends StatelessWidget {
  TimeSlot(
      {super.key,
      required this.cash,
      required this.day,
      required this.controller,
      required this.alltimes});
  final Datum cash;
  final String day;
  final bool controller;
  List alltimes = [];
  @override
  Widget build(BuildContext context) {
    final wid = MediaQuery.of(context).size.width;
    final high = MediaQuery.of(context).size.height;
    final bookinController = Provider.of<BookinController>(context);
    return Consumer<BookinController>(builder: (context, value, _) {
      return AnimatedContainer(
        duration: const Duration(seconds: 1),
        width: controller ? wid : 0,
        height: controller ? high / 3 : 0,
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
                    " ₹ $day",
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
                alltimes.length,
                ((index) => GestureDetector(
                      onTap: () {
                        bookinController.selectedTimes(
                          index,
                          alltimes,
                        );
                      },
                      child: Times(
                        text: alltimes[index],
                        index: index,
                        selTim: alltimes,
                      ),
                    )),
              ),
            )
          ],
        ),
      );
    });
  }
}
