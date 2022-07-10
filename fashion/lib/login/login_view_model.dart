import 'dart:convert';

import 'package:fashion/common/validation.dart';
import 'package:fashion/dashboard/dashboard_view.dart';
import 'package:fashion/model/user_login_status_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../common/app.dart';

class LoginViewModel extends BaseViewModel {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> get loginFormKey => _loginFormKey;

  User user = User();

  List<User> allowedUsers = [
    User(email: "joe@black.lk", password: "Jo45*78"),
    User(email: "amal@acme.lk", password: "La79*!_io"),
    User(email: "peter@pan.lk", password: "Nap42-24"),
    User(email: "suvansan@gmail.com", password: "Suvansan@6"),
  ];

  String _errorText = "";
  String get errorText => _errorText;

  String? validateTextFeild(String? value, {required LoginType type}) {
    if (type == LoginType.email) {
      return Validations.validateEmail(value!);
    } else if (type == LoginType.password) {
      return Validations.validatePassword(value!);
    }
    return "";
  }

  void onTextChange(String value, {required LoginType type}) {
    if (type == LoginType.email) {
      user.email = value.trim();
    } else if (type == LoginType.password) {
      user.password = value.trim();
    }
  }

  void onSignIn(BuildContext context) async {
    if (_loginFormKey.currentState!.validate()) {
      int index = allowedUsers.indexWhere(
        (value) => value.email == user.email && value.password == value.password,
      );
      if (index != -1) {
        UserLoginStatusModel userLoginStatusModel = UserLoginStatusModel(
          userEmail: user.email,
          signInDate: DateTime.now().toIso8601String(),
          isLogin: true,
        );
        await App.setUserLoginStatus(jsonEncode(userLoginStatusModel.toJson()));
        Future.delayed(Duration.zero, () {
          Navigator.popAndPushNamed(context, DashboardView.routeName, arguments: userLoginStatusModel);
        });
        debugPrint("done $index");
      } else {
        _errorText = "Invalid email or password";
        notifyListeners();
      }
    }
  }
}

class User {
  String email;
  String password;

  User({this.email = "", this.password = ""});
}

enum LoginType {
  email,
  password,
}
