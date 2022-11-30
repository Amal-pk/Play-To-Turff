import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:turf_app/view/details/view/details.dart';
import 'package:turf_app/view/spot/controller/sopt_controller.dart';
import 'package:turf_app/view/spot/view/widget.dart';

class AllTruffDisplay extends StatelessWidget {
  const AllTruffDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<SoptController>(
          builder: (context, value, _) {
            return ListView.builder(
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
            );
          },
        ),
      ],
    );
  }
}
