import 'package:saasify/data/models/categories/delete_categories_model.dart';
import 'package:saasify/data/models/categories/edit_categories_model.dart';
import 'package:saasify/data/models/categories/fetch_all_categories_model.dart';
import '../../data/models/payment/add_payment_method_model.dart';

abstract class PaymentRepository {
  Future<FetchAllCategoriesModel> fetchAllCategories(
      String userId, String companyId, int branchId);

  Future<EditCategoriesModel> editCategories(
      String userId, String companyId, int branchId, Map categoriesDetailsMap);

  Future<DeleteCategoriesModel> deleteCategories(
      String userId, String companyId, int branchId, Map categoryIdMap);

  Future<SavePaymentMethodModel> savePayment(
      String userId, String companyId, int branchId, Map paymentDetailsMap);
}
