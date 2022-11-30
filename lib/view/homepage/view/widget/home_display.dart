import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turf_app/view/core.dart';
import 'package:turf_app/view/homepage/controller/homapage_controller.dart';
import 'package:turf_app/view/homepage/view/widget/view_all.dart';
import 'package:turf_app/view/homepage/view/widget/gridview.dart';
import 'package:turf_app/view/spot/controller/sopt_controller.dart';

class HomeDisplay extends StatelessWidget {
  const HomeDisplay({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final HomePageController controller =
        Provider.of<HomePageController>(context);
    final high = MediaQuery.of(context).size.height;
    final wid = MediaQuery.of(context).size.width;
    SoptController _controller = context.read<SoptController>();
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          height: high / 6,
          width: wid,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              // filterQuality: FilterQuality.medium,
              fit: BoxFit.fill,
              image: AssetImage("asset/image/football_d.webp"),
            ),
          ),
        ),
        height10,
        const Divider(
          thickness: 2,
        ),
        Consumer<HomePageController>(builder: (context, value, _) {
          return controller.isLoading
              ? const CircularProgressIndicator(
                  color: Colors.grey,
                )
              : GridviewPage();
        }),
        Consumer<SoptController>(builder: (context, value, _) {
          return _controller.isLoading
              ? const CircularProgressIndicator()
              : const ViewAllTruff();
        }),
      ],
    );
  }
}
