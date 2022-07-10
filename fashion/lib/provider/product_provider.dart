import 'package:fashion/model/product_model.dart';
import 'package:fashion/services/product_service.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider extends ChangeNotifier {
  ProductModel? _productModel;
  ProductModel? get productModel => _productModel;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void getSingleProduct({required int id}) async {
    _isLoading = true;
    try {
      _productModel = await ProductService.getSingleProducts(id: id);
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
    }
    notifyListeners();
  }
}
