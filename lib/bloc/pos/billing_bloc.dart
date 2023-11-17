import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/data/customer_cache/customer_cache.dart';
import 'package:saasify/data/models/billing/fetch_products_by_category_model.dart';
import '../../di/app_module.dart';
import '../../repositories/billing/billing_repository.dart';
import 'billing_event.dart';
import 'billing_state.dart';

class BillingBloc extends Bloc<BillingEvents, BillingStates> {
  final CustomerCache _customerCache = getIt<CustomerCache>();
  final BillingRepository _billingRepository = getIt<BillingRepository>();
  String customerContact = '-';
  int selectedCategoryIndex = 0;

  BillingBloc() : super(BillingInitial()) {
    on<FetchProductsByCategory>(_fetchProductsByCategory);
  }

  FutureOr<void> _fetchProductsByCategory(
      FetchProductsByCategory event, Emitter<BillingStates> emit) async {
    emit(FetchingProductsByCategory());
    // try {
    String userId = await _customerCache.getUserId();
    String companyId = await _customerCache.getCompanyId();
    int branchId = await _customerCache.getBranchId();
    FetchProductsByCategoryPosModel fetchProductsByCategoryPosModelModel =
        await _billingRepository.fetchProductsByCategory(
            userId, companyId, branchId);

    if (fetchProductsByCategoryPosModelModel.status == 200) {
      emit(ProductsFetched(
          selectedCategoryIndex: selectedCategoryIndex,
          productsByCategories: fetchProductsByCategoryPosModelModel.data));
    } else {
      emit(ErrorFetchingProductsByCategory(
          message: fetchProductsByCategoryPosModelModel.message));
    }
    // } catch (e) {
    //   emit(ErrorFetchingProductsByCategory(message: e.toString()));
    // }
  }
}
