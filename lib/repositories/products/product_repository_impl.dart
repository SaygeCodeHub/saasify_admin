import 'package:saasify/data/models/products/fetch_all_categories_model.dart';
import 'package:saasify/data/models/products/product_list_model.dart';
import 'package:saasify/repositories/products/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<ProductListModel> fetchProductList(
      String userId, String companyId, int branchId) async {
    final response = {
      "status": 200,
      "message": "success",
      "data": [
        {
          "category_id": 1,
          "category_name": "Snacks",
          "product_id": 1,
          "product_name": "2-Min Masala Instant",
          "brand_name": "Maggi",
          "variant_id": 5,
          "variant_cost": 84.0,
          "quantity": 420,
          "discounted_cost": null,
          "discount": null,
          "stock": 150,
          "description": "sdfghjkl;'",
          "image": ["qwertyuio", "zxcvbnm"],
          "ratings": 4,
          "measuring_unit": "g",
          "barcode_no": 98765
        }
      ]
    };
    return ProductListModel.fromJson(response);
  }

  @override
  Future<FetchAllCategoriesModel> fetchAllCategoriesModel() async {
    final response = {
      "status": 200,
      "message": "success",
      "data": [
        {"category_id": 1, "category_name": "Snacks"}
      ]
    };

    return FetchAllCategoriesModel.fromJson(response);
  }

  @override
  Future saveProduct(String userId, String companyId, int branchId) async {
    final response = {};

    return response;
  }

  @override
  Future deleteProduct(String userId, String companyId, int branchId) async {
    final response = {};

    return response;
  }
}
