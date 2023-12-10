import 'package:saasify/data/models/payment/add_payment_method_model.dart';
import 'package:saasify/repositories/payment/payment_repository.dart';
import '../../data/models/payment/delete_payment_method_model.dart';
import '../../data/models/payment/edit_payment_method_model.dart';
import '../../data/models/payment/fetch_all_payment_method.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  @override
  Future<FetchAllPaymentModel> fetchAllPayments(
      String userId, String companyId, int branchId) async {
    final response = {
      "status": 200,
      "data": [
        {"payment_id": 1, "payment_name": "UPI", "is_active": true}
      ],
      "message": "Success"
    };
    // final response =
    // await ClientServices().get(
    //     '${ApiConstants.baseUrl}$userId/$companyId/$branchId/getAllPaymentMethods');
    return FetchAllPaymentModel.fromJson(response);
  }

  @override
  Future<EditPaymentMethodModel> editPayment(String userId, String companyId,
      int branchId, Map paymentDetailsMap) async {
    final response = {"status": 200, "data": {}, "message": "Successfully"};
    // final response = await ClientServices().put(
    //     '${ApiConstants.baseUrl}$userId/$companyId/$branchId/editCategory',
    //     categoriesDetailsMap);
    return EditPaymentMethodModel.fromJson(response);
  }

  @override
  Future<DeletePaymentMethodModel> deletePayment(
      String userId, String companyId, int branchId, Map paymentIdMap) async {
    final response = {
      "status": 200,
      "data": {},
      "message": "Payment Method deleted successfully"
    };
    // final response = await ClientServices().delete(
    //     '${ApiConstants.baseUrl}$userId/$companyId/$branchId/deleteCategory',
    //     categoryIdMap);
    return DeletePaymentMethodModel.fromJson(response);
  }

  @override
  Future<SavePaymentMethodModel> savePayment(String userId, String companyId,
      int branchId, Map paymentDetailsMap) async {
    final response = {"status": 200, "data": {}, "message": "Successfully"};
    // final response = await ClientServices().post(
    //     '${ApiConstants.baseUrl}$userId/$companyId/$branchId/addProduct',
    //     productDetailsMap);
    return SavePaymentMethodModel.fromJson(response);
  }
}
