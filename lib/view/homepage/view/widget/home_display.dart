// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:turf_app/view/core.dart';
import 'package:turf_app/view/details/controller/details_controller.dart';
import 'package:turf_app/view/homepage/controller/homapage_controller.dart';
import 'package:turf_app/view/homepage/view/widget/view_all.dart';
import 'package:turf_app/view/homepage/view/widget/gridview.dart';
import 'package:turf_app/view/spot/controller/sopt_controller.dart';

class HomeDisplay extends StatelessWidget {
  HomeDisplay({Key? key}) : super(key: key);
  final HomePageController controller = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    final high = MediaQuery.of(context).size.height;
    final wid = MediaQuery.of(context).size.width;
    SoptController _controller = context.read<SoptController>();
    return Column(
      children: [
        Container(
          height: high / 6,
          width: wid,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Hai, Amal ",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    FittedBox(
                      child: Text(
                        "Explore vanues and \nbook your favourite \nspot... ",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset(
                "asset/image/images.jpg",
                height: high / 5,
                width: wid / 3,
              ),
            ],
          ),
        ),
        height10,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Divider(),
            Consumer<DetailsController>(
              builder: (context, value, _) {
                return TextButton(
                  onPressed: (() {
                    value.allTurfView();
                  }),
                  child: const Text(
                    "veiw all",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        Obx(
          () => controller.isLoading.value
              ? const CircularProgressIndicator(
                  color: Colors.grey,
                )
              : GridviewPage(),
        ),
        Consumer<SoptController>(builder: (context, value, _) {
          return _controller.isLoading
              ? const CircularProgressIndicator()
              : const ViewAllTruff();
        }),
      ],
    );
  }
}
