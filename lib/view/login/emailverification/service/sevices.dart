import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:turf_app/error_handling_function/error_handling_function.dart';
import 'package:turf_app/view/core.dart';
import 'package:turf_app/view/login/emailverification/model/model.dart';

class EmailVerficationService extends ChangeNotifier {
  static emailVerifying(dynamic value) async {
    ErrorCode errorCode = ErrorCode();
    print("jgjhjghtfjfyjyu");
    try {
      Response response = await Dio().post(baseUrl + emailOTP, data: value);
      if (response.statusCode == 200) {
        // var datas = await json.decode(response.data);

        return SignupEmailVerifyModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      return errorCode.status401(e);
    } catch (e) {
      print("error-----------$e");
    }
  }
}
