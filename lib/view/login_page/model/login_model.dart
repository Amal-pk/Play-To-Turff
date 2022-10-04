class LoginModel {
  String? email;
  String? password;
  LoginModel({
    this.email,
    this.password,
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
