import 'package:flutter/material.dart';
import 'package:turf_app/view/homepage/model/nearbymodel/nearbymoel.dart';
import 'package:turf_app/view/login/login_page/model/login_model.dart';

loginSuccess(dynamic response, context) {
  if (response.statusCode == 200) {
    // print(response.data);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Login successfully"),
        backgroundColor: Color.fromARGB(255, 97, 98, 97),
      ),
    );
    return LoginRespoModel.fromJson(response.data);
  }
}

nearBy(dynamic response) {
  if (response.statusCode == 200) {
    // print(response.data);
    const SnackBar(
      content: Text("Login successfully"),
      backgroundColor: Color.fromARGB(255, 97, 98, 97),
    );
    return HomeResponse.fromJson(response.data);
  }
}
