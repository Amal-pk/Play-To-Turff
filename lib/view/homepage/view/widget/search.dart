import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turf_app/view/homepage/controller/homapage_controller.dart';
import 'package:turf_app/view/homepage/view/widget/sreach_gridview.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    final HomePageController homePageController =
        Provider.of<HomePageController>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Text("hasddja"),
          Consumer<HomePageController>(builder: (context, value, _) {
            return AnimatedCrossFade(
              firstChild: const Empty(),
              secondChild: const SearchView(),
              crossFadeState: homePageController.isSearchClick
                  ? (CrossFadeState.showSecond)
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 300),
              firstCurve: Curves.fastOutSlowIn,
              secondCurve: Curves.fastLinearToSlowEaseIn,
            );
          }),
        ],
      ),
    );
  }
}

class Empty extends StatelessWidget {
  const Empty({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Text("Search Any Turf")),
    );
  }
}
