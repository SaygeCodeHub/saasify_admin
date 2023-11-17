import 'package:saasify/data/models/inventory/fetch_inventory_list_model.dart';

import 'package:saasify/data/models/inventory/update_stock_model.dart';
import 'package:saasify/services/client_services.dart';
import 'package:saasify/utils/constants/api_constants.dart';

import 'inventory_repository.dart';

class InventoryRepositoryImpl implements InventoryRepository {
  @override
  Future<FetchInventoryProductsModel> fetchInventoryProductList(
      String userId, String companyId, int branchId) async {
    // final response = await ClientServices().get('${ApiConstants.baseUrl}$userId/$companyId/$branchId/getInventoryProducts');

    final response = {
      "status": 200,
      "data": [
        {
          "category_id": 3,
          "category_name": "Scdsqwersw",
          "product_id": 3,
          "product_name": "vartiawerfg ytossswww",
          "brand_name": "edot",
          "brand_id": 3,
          "variant_id": 3,
          "cost": 18.0,
          "quantity": 50,
          "discount_percent": null,
          "stock": 19,
          "stock_id": 7,
          "product_description": "qwsdcfvgbhnjmklokijuhygtfrdes",
          "images": ["wertyuj"],
          "unit": "kg",
          "barcode": 9,
          "draft": false,
          "restock_reminder": 10
        },
        {
          "category_id": 5,
          "category_name": "Sqwersw",
          "product_id": 5,
          "product_name": "back populate",
          "brand_name": "dot",
          "brand_id": 4,
          "variant_id": 6,
          "cost": 18.0,
          "quantity": 50,
          "discount_percent": null,
          "stock": 90,
          "stock_id": 10,
          "product_description": "qwshnjmklokijuhygtfrdes",
          "images": ["wertyuj"],
          "unit": "kg",
          "barcode": 8745,
          "draft": false,
          "restock_reminder": 10
        },
        {
          "category_id": 6,
          "category_name": "testing",
          "product_id": 6,
          "product_name": "back populate",
          "brand_name": "dot",
          "brand_id": 4,
          "variant_id": 7,
          "cost": 18.0,
          "quantity": 50,
          "discount_percent": null,
          "stock": 90,
          "stock_id": 11,
          "product_description": "qwshnjmklokijuhygtfrdes",
          "images": ["wertyuj"],
          "unit": "kg",
          "barcode": 8748525,
          "draft": false,
          "restock_reminder": 10
        }
      ],
      "message": "get all products"
    };
    return FetchInventoryProductsModel.fromJson(response);
  }

  @override
  Future<UpdateStockModel> updateStock(
      String userId, String companyId, int branchId, Map updateStockMap) async {
    final response = await ClientServices().post(
        '${ApiConstants.baseUrl}$userId/$companyId/$branchId/updateStock',
        updateStockMap);

    return UpdateStockModel.fromJson(response);
  }
}
