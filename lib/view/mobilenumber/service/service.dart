import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

import 'package:turf_app/view/core.dart';
import 'package:turf_app/view/mobilenumber/model/model.dart';

import '../controller/controller.dart';

class MobileNumberServices {
  static otpverfyimg(dynamic value, context) async {
    try {
      Response response = await Dio().post(baseUrl + mobileUrl, data: value);
      if (response.statusCode == 200) {
        // var datas = await json.decode(response.data);
        final data = MobileNumberRespoModel.fromJson(response.data);
        log(data.id.toString());

        final demo = Provider.of<MobileOtpController>(listen: false, context);
        demo.mobileId = data.id;
        print(mobileOTP);

        return data;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        final dtaa = MobileNumberRespoModel.fromJson(e.response!.data);
        log(dtaa.status.toString());
        return dtaa;
      }
    } catch (e) {
      print("mobile otp erorrrrrreeeeeeeeeeee $e");
    }
  }
}
