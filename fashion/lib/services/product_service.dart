import 'package:fashion/model/product_model.dart';
import 'package:fashion/services/http_service.dart';

class ProductService {
  static Future<List<String>> getCategories() async {
    try {
      ResponseBody responseBody = await get("products/categories");
      if (!responseBody.isError) {
        List<String> categories = List<String>.from(responseBody.result.map((value) => value));
        return categories;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  static Future<List<ProductModel>> getProducts() async {
    try {
      ResponseBody responseBody = await get("products");
      if (!responseBody.isError) {
        List<ProductModel> products = List<ProductModel>.from(responseBody.result.map((value) => ProductModel.fromJson(value)));
        return products;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  static Future<ProductModel?> getSingleProducts({required int id}) async {
    try {
      ResponseBody responseBody = await get("products/$id");
      if (!responseBody.isError) {
        ProductModel product = ProductModel.fromJson(responseBody.result);
        return product;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
