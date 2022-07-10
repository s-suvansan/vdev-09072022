import 'dart:convert';

import 'package:fashion/model/product_model.dart';
import 'package:fashion/model/user_login_status_model.dart';
import 'package:fashion/services/product_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../common/app.dart';

class DashboardProvider extends ChangeNotifier {
  Map<String, List<ProductModel>> _productList = {};
  Map<String, List<ProductModel>> get productList => _productList;
  set setProductList(Map<String, List<ProductModel>> value) => _productList = value;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<UserLoginStatusModel> checkAuthentication() async {
    String value = await App.getUserLoginStatus();
    UserLoginStatusModel userLoginStatusModel = UserLoginStatusModel(isLogin: false);
    if (value != "") {
      userLoginStatusModel = UserLoginStatusModel.fromJson(jsonDecode(value));
    }
    return userLoginStatusModel;
  }

  void getCategories() async {
    _isLoading = true;
    try {
      List<String> categories = await ProductService.getCategories();
      if (categories.isNotEmpty) {
        categories.sort();
        for (var category in categories) {
          _productList.putIfAbsent(category, () => []);
        }
        _getProducts();
      } else {
        _isLoading = false;
      }
    } catch (e) {
      // _categories = [];
      _isLoading = false;
    }
    notifyListeners();
  }

  void _getProducts() async {
    try {
      List<ProductModel> products = await ProductService.getProducts();
      if (products.isNotEmpty) {
        for (var product in products) {
          _productList[product.category]?.add(product);
        }
        _isLoading = false;
      } else {
        _isLoading = false;
      }
    } catch (e) {
      // _products = [];
      _isLoading = false;
    }
    notifyListeners();
  }
}
