import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turf_app/view/core.dart';
import 'package:turf_app/view/sopt/controller/sopt_controller.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SoptController>(context, listen: false);

    return Consumer<SoptController>(builder: (context, value, _) {
      return controller.searchItems.isEmpty
          ? Text("No Data")
          : GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: controller.searchItems.length,
              itemBuilder: ((context, index) {
                final turfss = controller.searchItems[index];

                return Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        child: Image(
                          // height: 80,
                          width: double.infinity,
                          image: NetworkImage(
                            turfss.turfLogo!,
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                      height10,
                      Text(
                        turfss.turfName!,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      height10,
                      FittedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.black,
                                  size: 16,
                                ),
                                Text(
                                  turfss.turfPlace!,
                                ),
                              ],
                            ),
                            width10,
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Text(
                                  turfss.turfInfo!.turfRating!.toString(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            );
    });
  }
}
