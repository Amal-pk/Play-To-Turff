import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:turf_app/view/core.dart'; 
import 'package:turf_app/view/emailverification/model/model.dart';

class EmailVerficationService extends ChangeNotifier {
  static emailVerifying(dynamic value) async {
    print("jgjhjghtfjfyjyu");
    try {
      Response response = await Dio().post(baseUrl + emailOTP, data: value);
      if (response.statusCode == 200) {
        // var datas = await json.decode(response.data);
        return SignupEmailVerifyModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        return SignupEmailVerifyModel.fromJson(e.response!.data);
      }
    } catch (e) {
      print("error-----------$e");
    }
  }
}
