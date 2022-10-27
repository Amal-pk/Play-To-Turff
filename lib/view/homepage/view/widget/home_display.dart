import 'package:flutter/material.dart';
import 'package:turf_app/view/core.dart';
import 'package:turf_app/view/homepage/view/widget/gridview.dart';

class HomeDisplay extends StatelessWidget {
  const HomeDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Hai, Amal ",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Explore vanues and \n book your favourite \nspot... ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Image.asset(
                "asset/image/images.jpg",
                height: 120,
                width: 150,
              ),
            ],
          ),
        ),
        height10,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Near by Grounds",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "veiw all",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        GridviewPage(),
      ],
    );
  }
}
