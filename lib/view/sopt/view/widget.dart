import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turf_app/view/core.dart';
import 'package:turf_app/view/homepage/model/nearbymodel/datum_model.dart';
import 'package:turf_app/view/sopt/controller/sopt_controller.dart';

class AllTurffWidget extends StatelessWidget {
  const AllTurffWidget({super.key, required this.all});
  final Datum all;
  @override
  Widget build(BuildContext context) {
    return Consumer<SoptController>(builder: (context, value, _) {
      return Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(all.turfLogo!),
              ),
            ),
            height: 50,
            width: 50,
          ),
          width10,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  all.turfName.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${all.turfPlace}, ${all.turfMunicipality},  ${all.turfDistrict}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
