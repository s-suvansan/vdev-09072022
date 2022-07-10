import 'package:fashion/login/login_view.dart';
import 'package:fashion/model/product_model.dart';
import 'package:fashion/model/user_login_status_model.dart';
import 'package:fashion/product/product_view.dart';
import 'package:fashion/provider/product_provider.dart';
import 'package:fashion/widget/common_popup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../common/app.dart';
import '../provider/dashboard_provider.dart';

class DashboardViewModel extends BaseViewModel {
  UserLoginStatusModel? _userLoginStatusModel;
  UserLoginStatusModel? get userLoginStatusModel => _userLoginStatusModel;

  void onInit(BuildContext context) {
    _userLoginStatusModel = ModalRoute.of(context)?.settings.arguments as UserLoginStatusModel;
    debugPrint(App.formattedDateTime(_userLoginStatusModel?.signInDate));
  }

  void onSignOut(BuildContext context) {
    App.showCommonPopup(
        context,
        const CommonPopup(
          text: "Logout",
          desc: "Do you want to logout?",
        )).then((value) {
      if (value != null && value) {
        App.removeUserLoginStatus();
        context.read<DashboardProvider>().setProductList = {};
        Navigator.popAndPushNamed(context, LoginView.routeName);
      }
    });
  }

  void openProductView(BuildContext context, ProductModel product) {
    context.read<ProductProvider>().getSingleProduct(id: product.id!);
    Navigator.of(context).pushNamed(ProductView.routeName);
  }
}
