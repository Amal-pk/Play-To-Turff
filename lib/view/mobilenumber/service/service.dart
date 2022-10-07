import 'package:dio/dio.dart';

import 'package:turf_app/view/core.dart';
import 'package:turf_app/view/mobilenumber/model/model.dart';

class MobileVerificationServices {
  otpverfyimg(dynamic value) async {
    Response response = await Dio().post(baseUrl + mobileOTP, data: value);
    try {
      if (response.statusCode == 200) {
        // var datas = await json.decode(response.data);
        return MobileVerificationResponseModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        return MobileVerificationResponseModel.fromJson(response.data);
      }
    } catch (e) {
      print("mobile otp erorrrrrreeeeeeeeeeee $e");
    }
  }
}
