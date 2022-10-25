import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turf_app/view/core.dart';
import 'package:turf_app/view/details/controller/details_controller.dart';
import 'package:turf_app/view/homepage/model/nearbymodel/datum_model.dart';

class PriceDetailsWidget extends StatelessWidget {
  const PriceDetailsWidget({super.key, required this.detail});
  final Datum detail;
  @override
  Widget build(BuildContext context) {
    DetailsController controller = context.read<DetailsController>();
    return Consumer<DetailsController>(
      builder: (context, value, _) {
        return AnimatedContainer(
          width: controller.priceOnTap ? 500 : 0,
          height: controller.priceOnTap ? 200 : 0,
          color: controller.priceOnTap ? Colors.white : Colors.white12,
          alignment: controller.priceOnTap
              ? Alignment.center
              : AlignmentDirectional.centerStart,
          duration: const Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
          child: FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 250,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2,
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.sunny,
                        color: Colors.amber,
                        size: 25,
                      ),
                      height20,
                      const Text(
                        "Afternoon Price",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      height20,
                      Text(
                        detail.turfPrice!.afternoonPrice.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 250,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2,
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.nightlight,
                        color: Colors.grey,
                        size: 25,
                      ),
                      height20,
                      const Text(
                        "Evening Price",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      height20,
                      Text(
                        detail.turfPrice!.eveningPrice.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 250,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2,
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.wb_sunny,
                        color: Colors.yellow,
                        size: 25,
                      ),
                      height20,
                      const Text(
                        "Morning Price",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      height20,
                      Text(
                        detail.turfPrice!.morningPrice.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
