import 'package:dio/dio.dart';

import 'package:turf_app/view/core.dart';
import 'package:turf_app/view/login/mobile_verification/model/mobile_ver_model.dart';

class MobileVerificationServices {
  static otpVerfy(dynamic value) async {
    try {
      Response response = await Dio().post(baseUrl + mobileOTP, data: value);
      if (response.statusCode == 200) {
        final datas = MobileVerificationResponseModel.fromJson(response.data);
        return datas;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        return MobileVerificationResponseModel.fromJson(e.response!.data);
      }
    } catch (e) {
      print("mobile otp erorrrrrreeeeeeeeeeee $e");
    }
  }
}
