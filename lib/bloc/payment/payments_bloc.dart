import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/payment/payments_event.dart';
import 'package:saasify/bloc/payment/payments_states.dart';
import '../../data/customer_cache/customer_cache.dart';
import '../../data/models/payment/add_payment_method_model.dart';
import '../../data/models/payment/delete_payment_method_model.dart';
import '../../data/models/payment/edit_payment_method_model.dart';
import '../../data/models/payment/fetch_all_payment_method.dart';
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
    // try {
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
    // } catch (e) {
    //   emit(ErrorSavingPayment(message: e.toString()));
    // }
  }

  FutureOr<void> _editPayment(
      EditPayment event, Emitter<PaymentStates> emit) async {
    emit(EditingPayment());
    // try {
    String userId = await _customerCache.getUserId();
    String companyId = await _customerCache.getCompanyId();
    int branchId = await _customerCache.getBranchId();

    EditPaymentMethodModel editPaymentMethodModel = await _paymentRepository
        .editPayment(userId, companyId, branchId, event.paymentDetailsMap);

    if (editPaymentMethodModel.status == 200) {
      emit(EditedPayment(message: editPaymentMethodModel.message));
    } else {
      emit(ErrorEditingPayment(message: editPaymentMethodModel.message));
    }
    // } catch (e) {
    //   emit(ErrorEditingPayment(message: e.toString()));
    // }
  }

  FutureOr<void> _deletePayment(
      DeletePayment event, Emitter<PaymentStates> emit) async {
    emit(DeletingPayment());
    // try {
    String userId = await _customerCache.getUserId();
    String companyId = await _customerCache.getCompanyId();
    int branchId = await _customerCache.getBranchId();

    Map idsMap = {"payment_id": event.paymentId};

    DeletePaymentMethodModel deletePaymentMethodModel = await _paymentRepository
        .deletePayment(userId, companyId, branchId, idsMap);

    if (deletePaymentMethodModel.status == 200) {
      emit(DeletedPayment(message: deletePaymentMethodModel.message));
    } else {
      emit(ErrorDeletingPayment(message: deletePaymentMethodModel.message));
    }
    // } catch (e) {
    //   e.toString();
    // }
  }

  FutureOr<void> _fetchAllPayment(
      FetchAllPayment event, Emitter<PaymentStates> emit) async {
    emit(FetchingPayment());
    // try {
    String userId = await _customerCache.getUserId();
    String companyId = await _customerCache.getCompanyId();
    int branchId = await _customerCache.getBranchId();

    FetchAllPaymentModel fetchAllPaymentModel =
        await _paymentRepository.fetchAllPayments(userId, companyId, branchId);
    if (fetchAllPaymentModel.status == 200) {
      emit(FetchedPayment(paymentData: fetchAllPaymentModel.data));
    } else {
      emit(ErrorFetchingPayment(message: fetchAllPaymentModel.message));
    }
    // } catch (e) {
    //   emit(ErrorFetchingPayment(message: e.toString()));
    // }
  }
}
