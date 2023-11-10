import 'package:saasify/services/client_services.dart';

import '../../data/models/billing/coupons_model.dart';
import '../../data/models/billing/fetch_products_by_category_model.dart';
import 'billing_repository.dart';

class BillingRepositoryImpl extends BillingRepository {
  @override
  Future<FetchProductsByCategoryModel> fetchProductsByCategory() async {
    final response = await ClientServices()
        .get("https://oneart.onrender.com/getAllCategoriesProducts");
    return FetchProductsByCategoryModel.fromJson(response);
  }

  @override
  Future<CouponsModel> fetchCoupons() async {
    final response = {
      "status": 200,
      "message": "Shops fetched",
      "data": [
        {
          "coupon_name": "PAYTM TREATS",
          "isActive": true,
          "description": "get 300 off",
          "discount_amount": 300.0,
          "coupon_id": 111,
          "coupon_image": "https://oneart.onrender.com/images/paytm.jpeg"
        },
        {
          "coupon_name": "PAYTM TREATS",
          "isActive": true,
          "description": "get 300 off",
          "discount_amount": 300.0,
          "coupon_id": 111,
          "coupon_image": "https://oneart.onrender.com/images/paytm.jpeg"
        }
      ]
    };
    return CouponsModel.fromJson(response);
  }
}
