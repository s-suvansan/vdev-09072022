import 'package:fashion/model/user_login_status_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../common/app.dart';

class DashboardViewModel extends BaseViewModel {
  UserLoginStatusModel? _userLoginStatusModel;
  UserLoginStatusModel? get userLoginStatusModel => _userLoginStatusModel;

  void onInit(BuildContext context) {
    _userLoginStatusModel = ModalRoute.of(context)?.settings.arguments as UserLoginStatusModel;
    debugPrint(App.formattedDateTime(_userLoginStatusModel?.signInDate));
  }
}
