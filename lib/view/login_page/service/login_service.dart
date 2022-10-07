import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:turf_app/view/core.dart';
import 'package:turf_app/view/login_page/model/login_model.dart';

class LoginService { 
  usersLogin(dynamic value) async {
    Response response = await Dio().post(baseUrl + loginUrl, data: value);
    try {
      if (response.statusCode == 200) {
        var datas = await json.decode(response.data);
        final emailtp = datas;
        print('$emailtp');
        return LoginRespoModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        return LoginRespoModel.fromJson(response.data);
      }
    } catch (e) {
      print("dfi");
    }
  }
}
