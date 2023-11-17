import 'dart:developer';

import 'package:saasify/data/models/billing/fetch_products_by_category_model.dart';
import 'package:saasify/services/client_services.dart';
import 'package:saasify/utils/constants/api_constants.dart';
import 'billing_repository.dart';

class BillingRepositoryImpl implements BillingRepository {
  @override
  Future<FetchProductsByCategoryPosModel> fetchProductsByCategory(
      String userId, String companyId, int branchId) async {
    final response = await ClientServices().get(
        'https://saasify-qm2p.onrender.com/v1/OvcqwTKNuHSL5ILAOZ6Y3OGcmrj2/1699579724/4/getProductsByCategory');
    log('${ApiConstants.baseUrl}$userId/$companyId/$branchId/getProductsByCategory');
    return FetchProductsByCategoryPosModel.fromJson(response);
  }
}
