import 'package:fashion/dashboard/dashboard_view.dart';
import 'package:fashion/login/login_view.dart';
import 'package:fashion/provider/dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../model/user_login_status_model.dart';

class InitViewModel extends BaseViewModel {
  void onInit(BuildContext context) async {
    UserLoginStatusModel userLoginStatusModel = await context.read<DashboardProvider>().checkAuthentication();
    Future.delayed(const Duration(milliseconds: 1000), () {
      if (userLoginStatusModel.isLogin ?? false) {
        context.read<DashboardProvider>().getCategories();
        Navigator.popAndPushNamed(context, DashboardView.routeName, arguments: userLoginStatusModel);
      } else {
        Navigator.popAndPushNamed(context, LoginView.routeName);
      }
    });
  }
}
