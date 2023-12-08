import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/payment/payments_event.dart';
import 'package:saasify/bloc/payment/payments_states.dart';
import 'package:saasify/data/models/categories/delete_categories_model.dart';
import 'package:saasify/data/models/categories/edit_categories_model.dart';
import 'package:saasify/data/models/categories/fetch_all_categories_model.dart';
import '../../data/customer_cache/customer_cache.dart';
import '../../data/models/payment/add_payment_method_model.dart';
import '../../di/app_module.dart';
import '../../repositories/payment/payment_repository.dart';

class PaymentBloc extends Bloc<PaymentEvents, PaymentStates> {
  final CustomerCache _customerCache = getIt<CustomerCache>();
  final PaymentRepository _paymentRepository = getIt<PaymentRepository>();

  PaymentStates get initialState => PaymentInitial();

  PaymentBloc() : super(PaymentInitial()) {
    on<SavePayment>(_savePayment);
    on<EditPayment>(_editPayment);
    on<DeletePayment>(_deletePayment);
    on<FetchAllPayment>(_fetchAllPayment);
  }

  FutureOr<void> _savePayment(
      SavePayment event, Emitter<PaymentStates> emit) async {
    emit(SavingPayment());
    try {
      String userId = await _customerCache.getUserId();
      String companyId = await _customerCache.getCompanyId();
      int branchId = await _customerCache.getBranchId();

      SavePaymentMethodModel saveBranchesModel = await _paymentRepository
          .savePayment(userId, companyId, branchId, event.paymentDetailsMap);

      if (saveBranchesModel.status == 200) {
        emit(SavedPayment(message: saveBranchesModel.message));
      } else {
        emit(ErrorSavingPayment(message: saveBranchesModel.message));
      }
    } catch (e) {
      emit(ErrorSavingPayment(message: e.toString()));
    }
  }

  FutureOr<void> _editPayment(
      EditPayment event, Emitter<PaymentStates> emit) async {
    emit(EditingPayment());
    try {
      String userId = await _customerCache.getUserId();
      String companyId = await _customerCache.getCompanyId();
      int branchId = await _customerCache.getBranchId();

      EditCategoriesModel editCategoriesModel = await _paymentRepository
          .editCategories(userId, companyId, branchId, event.paymentDetailsMap);

      if (editCategoriesModel.status == 200) {
        emit(EditedPayment(message: editCategoriesModel.message));
      } else {
        emit(ErrorEditingPayment(message: editCategoriesModel.message));
      }
    } catch (e) {
      emit(ErrorEditingPayment(message: e.toString()));
    }
  }

  FutureOr<void> _deletePayment(
      DeletePayment event, Emitter<PaymentStates> emit) async {
    emit(DeletingPayment());
    try {
      String userId = await _customerCache.getUserId();
      String companyId = await _customerCache.getCompanyId();
      int branchId = await _customerCache.getBranchId();

      Map idsMap = {"category_id": event.categoryId};

      DeleteCategoriesModel deleteCategoriesModel = await _paymentRepository
          .deleteCategories(userId, companyId, branchId, idsMap);

      if (deleteCategoriesModel.status == 200) {
        emit(DeletedPayment(message: deleteCategoriesModel.message));
      } else {
        emit(ErrorDeletingPayment(message: deleteCategoriesModel.message));
      }
    } catch (e) {
      e.toString();
    }
  }

  FutureOr<void> _fetchAllPayment(
      FetchAllPayment event, Emitter<PaymentStates> emit) async {
    emit(FetchingPayment());
    try {
      String userId = await _customerCache.getUserId();
      String companyId = await _customerCache.getCompanyId();
      int branchId = await _customerCache.getBranchId();

      FetchAllCategoriesModel fetchAllCategoriesModel = await _paymentRepository
          .fetchAllCategories(userId, companyId, branchId);
      if (fetchAllCategoriesModel.status == 200) {
        emit(FetchedPayment(categoryList: fetchAllCategoriesModel.data));
      } else {
        emit(ErrorFetchingPayment(message: fetchAllCategoriesModel.message));
      }
    } catch (e) {
      emit(ErrorFetchingPayment(message: e.toString()));
    }
  }
}
