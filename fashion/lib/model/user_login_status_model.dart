class UserLoginStatusModel {
  String? userEmail;
  String? signInDate;
  bool? isLogin;

  UserLoginStatusModel({
    this.userEmail,
    this.isLogin,
    this.signInDate,
  });

  factory UserLoginStatusModel.fromJson(Map<String, dynamic> json) => UserLoginStatusModel(
        userEmail: json["userEmail"] ?? "",
        signInDate: json["signInDate"] ?? DateTime.now().toIso8601String(),
        isLogin: json["isLogin"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "userEmail": userEmail,
        "signInDate": signInDate,
        "isLogin": isLogin,
      };
}
