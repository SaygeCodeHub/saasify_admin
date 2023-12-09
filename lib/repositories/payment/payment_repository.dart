import '../../data/models/payment/add_payment_method_model.dart';
import '../../data/models/payment/delete_payment_method_model.dart';
import '../../data/models/payment/edit_payment_method_model.dart';
import '../../data/models/payment/fetch_all_payment_method.dart';

abstract class PaymentRepository {
  Future<FetchAllPaymentModel> fetchAllPayments(
      String userId, String companyId, int branchId);

  Future<EditPaymentMethodModel> editPayment(
      String userId, String companyId, int branchId, Map paymentDetailsMap);

  Future<DeletePaymentMethodModel> deletePayment(
      String userId, String companyId, int branchId, Map paymentIdMap);

  Future<SavePaymentMethodModel> savePayment(
      String userId, String companyId, int branchId, Map paymentDetailsMap);
}
