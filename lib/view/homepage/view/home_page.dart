import 'package:flutter/material.dart';
import 'package:turf_app/view/login_page/view/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (() {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ),
            );
          }),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
          child: Text(
        'hello',
        style: TextStyle(fontSize: 35),
      )),
    );
  }
}
