import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:turf_app/view/core.dart';
import 'package:turf_app/view/details/controller/details_controller.dart';
import 'package:turf_app/view/details/view/details.dart';
import 'package:turf_app/view/spot/controller/sopt_controller.dart';
import 'package:turf_app/view/spot/view/widget.dart';

class ViewAllTruff extends StatelessWidget {
  const ViewAllTruff({super.key});

  @override
  Widget build(BuildContext context) {
    final high = MediaQuery.of(context).size.height;
    final wid = MediaQuery.of(context).size.width;

    DetailsController controller = context.read<DetailsController>();
    return Consumer<DetailsController>(
      builder: (context, value, _) {
        return controller.allTurffView
            ? AnimatedContainer(
                duration: const Duration(seconds: 5),
                width: controller.allTurffView ? 500 : 0,
                color: controller.allTurffView ? Colors.white : Colors.white,
                alignment: controller.allTurffView
                    ? Alignment.center
                    : AlignmentDirectional.centerStart,
                curve: Curves.fastOutSlowIn,
                child: Consumer<SoptController>(
                  builder: (context, value, _) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        height10,
                        // const Divider(
                        //   thickness: 2,
                        // ),
                        Text(
                          "All Turf",
                          style: TextStyle(
                            fontSize: high / 35,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0,
                          ),
                        ),
                        const Divider(
                          thickness: 2,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: value.allTruff.length,
                          itemBuilder: (context, index) {
                            final altruf = value.allTruff[index];
                            return GestureDetector(
                              onTap: () {
                                Get.to(
                                  () => Details(
                                    details: altruf,
                                  ),
                                );
                              },
                              child: Container(
                                // height: high / 9,
                                // width: wid,
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
                                child: AllTurffWidget(all: altruf),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              )
            : const SizedBox();
      },
    );
  }
}
