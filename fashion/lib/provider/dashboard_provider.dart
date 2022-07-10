import 'dart:convert';

import 'package:fashion/model/user_login_status_model.dart';
import 'package:flutter/cupertino.dart';

import '../common/app.dart';

class DashboardProvider extends ChangeNotifier {
  Future<UserLoginStatusModel> checkAuthentication() async {
    String value = await App.getUserLoginStatus();
    UserLoginStatusModel userLoginStatusModel = UserLoginStatusModel(isLogin: false);
    if (value != "") {
      userLoginStatusModel = UserLoginStatusModel.fromJson(jsonDecode(value));
    }
    return userLoginStatusModel;
  }
}
