class MobileVerificationResponseModel {
  String? id;
  String? otp;
  bool? status;
  String? number;

  MobileVerificationResponseModel({
    this.otp,
    this.id,
    this.status,
    this.number,
  });

  factory MobileVerificationResponseModel.fromJson(Map<String, dynamic> json) {
    return MobileVerificationResponseModel(
      // id: json['jwt'],
      status: json['status'],
    );
  }

  Map<String, dynamic> tojson() => {
        'user_otp': otp,
        '_id': id,
        'user_number': number,
      };
}
// import 'dart:convert';

// MobileVerificationRequestModel mobileOtpFromJson(String str) =>
//     MobileVerificationRequestModel.fromJson(json.decode(str));

// String mobileOtpToJson(MobileVerificationRequestModel data) =>
//     json.encode(data.toJson());

// class MobileVerificationRequestModel {
//   MobileVerificationRequestModel({
//     this.userOtp,
//     this.userNumber,
//     this.id,
//   });

//   String? userOtp;
//   String? userNumber;
//   String? id;

//   factory MobileVerificationRequestModel.fromJson(Map<String, dynamic> json) =>
//       MobileVerificationRequestModel(
//         userOtp: json["user_otp"],
//         userNumber: json["user_number"],
//         id: json["_id"],
//       );

//   Map<String, dynamic> toJson() => {
//         "user_otp": userOtp,
//         "user_number": userNumber,
//         "_id": id,
//       };
// }

// class MobileVerificationResponesModel {
//   MobileVerificationResponesModel({
//     this.status,
//     this.jwt,
//   });

//   bool? status;
//   String? jwt;

//   factory MobileVerificationResponesModel.fromJson(Map<String, dynamic> json) => MobileVerificationResponesModel(
//         status: json["status"],
//         jwt: json["jwt"],
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "jwt": jwt,
//       };
// }
