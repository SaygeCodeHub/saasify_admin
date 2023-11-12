import 'package:saasify/data/models/billing/fetch_products_by_category_model.dart';

abstract class BillingRepository {
  Future<FetchProductsByCategoryModel> fetchProductsByCategory(
      String userId, String companyId, int branchId);
}
