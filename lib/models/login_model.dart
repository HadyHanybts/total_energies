class LoginModel {
  final String userName;
  final String password;

  LoginModel({
    required this.userName,
    required this.password,
  });

  // Convert JSON to LoginModel
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      userName: json['userName'],
      password: json['password'],
    );
  }

  // Convert LoginModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'password': password,
    };
  }
}
