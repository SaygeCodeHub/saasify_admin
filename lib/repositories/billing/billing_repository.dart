import '../../data/models/billing/coupons_model.dart';
import '../../data/models/billing/fetch_products_by_category_model.dart';

abstract class BillingRepository {
  Future<FetchProductsByCategoryModel> fetchProductsByCategory();

  Future<CouponsModel> fetchCoupons();
}
