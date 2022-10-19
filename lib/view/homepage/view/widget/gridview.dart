import 'package:flutter/material.dart';
import 'package:turf_app/view/core.dart';

class GridviewPage extends StatelessWidget {
  const GridviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[300],
            ),
            child: Column(
              children: [
                Image.asset("asset/image/istockphoto-519558145-170667a.jpg"),
                height10,
                const Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                height10,
                Text("Location")
              ],
            ),
          );
        },
      ),
    );
  }
}
//  