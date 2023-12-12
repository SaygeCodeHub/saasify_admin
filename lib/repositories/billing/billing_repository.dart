import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saasify/data/models/billing/fetch_products_by_category_model.dart';
import 'package:saasify/data/models/billing/settle_order_model.dart';

abstract class BillingRepository {
  Future<FetchProductsByCategoryModel> fetchProductsByCategory(
      String userId, String companyId, int branchId);

  Future<SettleOrderModel> settleOrder(
      String userId, String companyId, int branchId, Map orderMap);

  Future<List<QueryDocumentSnapshot>> getAllTabs();

  Future<void> saveTab(Map<String, dynamic> customer, String id);

  Future<void> removeTab(String id);
}
