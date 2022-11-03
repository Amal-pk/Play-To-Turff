import 'package:flutter/material.dart';
import 'package:turf_app/view/homepage/model/nearbymodel/datum_model.dart';

class Times extends StatelessWidget {
  const Times({super.key, required this.time});
  final Datum time;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(15),
        height: 40,
        width: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 2,
              ),
            ]),
        child:const Center(
          child: Text("data"),
        ),
      ),
    );
  }
}
