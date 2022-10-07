import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:turf_app/view/core.dart';
import 'package:turf_app/view/register_page/model/register_model.dart';

class RegisterService {
  signupUser(dynamic value) async {
    Response response = await Dio().post(baseUrl + registerUrl, data: value);

    // log(response.toString());

    try {
      if (response.statusCode == 200) {
        var datas = await json.decode(response.data);
        final emailotp = datas;
        return RegisterRespoModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        return RegisterRespoModel.fromJson(response.data);
      }
    } catch (e) {
      print("error-----------$e");
    }
  }
}
