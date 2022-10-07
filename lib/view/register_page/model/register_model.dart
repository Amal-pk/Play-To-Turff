class RegisterModel {
  String? userEmail;
  String? userPassword;

  RegisterModel({
    required this.userEmail,
    required this.userPassword,
  });

  Map<String, dynamic> tojson() {
    return {
      'user_mail': userEmail,
      'user_password': userPassword,
    };
  }
}

class RegisterRespoModel {
  String? id;
  String? status;

  RegisterRespoModel({
    required this.id,
    required this.status,
  });

  factory RegisterRespoModel.fromJson(Map<String, dynamic> json) {
    return RegisterRespoModel(
      id: json['id'],
      status: json['status'],
    );
  }
}
