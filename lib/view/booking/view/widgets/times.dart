import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turf_app/view/booking/controller/controller.dart';

class Times extends StatelessWidget {
  const Times(
      {super.key,
      required this.text,
      required this.index,
      required this.selTim});
  final String text;
  final int index;
  final List selTim;
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<BookinController>(context);
    final wid = MediaQuery.of(context).size.width;
    return FittedBox(
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(15),
        height: 40,
        width: wid / 4.2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: controller.selectedTime.contains(selTim[index])
                ? Colors.green
                : Colors.white,
            boxShadow: [
              BoxShadow(
                color: controller.selectedTime.contains(selTim[index])
                    ? Colors.white
                    : Colors.grey,
                blurRadius: 3,
              ),
            ]),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: controller.selectedTime.contains(selTim[index])
                    ? Colors.white
                    : Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
