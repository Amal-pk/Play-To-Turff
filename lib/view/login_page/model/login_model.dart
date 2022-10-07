class LoginModel {
  String? email;
  String? password;
  LoginModel({
    required this.email,
    required this.password,
  });
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      email: json['user_mail'],
      password: json['user_password'],
    );
  }
  Map<String, dynamic> toJoson() => {
        'user_mail': email,
        'user_password': password,
      };
}

class LoginRespoModel {
  String? message;
  bool? status;

  LoginRespoModel({
    required this.message,
    required this.status,
  });

  factory LoginRespoModel.fromJson(Map<String, dynamic> json) {
    return LoginRespoModel(
      message: json['message'],
      status: json['status'],
    );
  }
}
