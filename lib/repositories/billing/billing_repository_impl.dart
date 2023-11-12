import 'dart:developer';

import 'package:saasify/data/models/billing/fetch_products_by_category_model.dart';
import 'package:saasify/services/client_services.dart';
import 'package:saasify/utils/constants/api_constants.dart';
import 'billing_repository.dart';

class BillingRepositoryImpl extends BillingRepository {
  @override
  Future<FetchProductsByCategoryModel> fetchProductsByCategory(
      String userId, String companyId, int branchId) async {
    final response = await ClientServices().get(
        '${ApiConstants.baseUrl}$userId/$companyId/$branchId/getProductsByCategory');
    log('${ApiConstants.baseUrl}$userId/$companyId/$branchId/getProductsByCategory');
    return FetchProductsByCategoryModel.fromJson(response);
  }
}
