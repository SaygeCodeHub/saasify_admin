import 'package:saasify/data/models/products/product_list_model.dart';
import 'package:saasify/repositories/products/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<ProductListModel> productList() async {
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
          "discounted_cost": 52.0,
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
}
