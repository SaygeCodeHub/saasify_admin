import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/product/product_state.dart';
import 'package:saasify/data/customer_cache/customer_cache.dart';
import 'package:saasify/data/models/products/product_list_model.dart';
import 'package:saasify/data/models/products/save_product_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/products/product_repository.dart';
import 'inventory_event.dart';
import 'inventory_states.dart';

class InventoryBloc extends Bloc<InventoryEvents, InventoryStates> {
  final CustomerCache _customerCache = getIt<CustomerCache>();
  final ProductRepository _productRepository = getIt<ProductRepository>();

  ProductStates get initialState => ProductInitial();

  InventoryBloc() : super(InventoryInitial()) {
    on<FetchInventoryList>(_fetchInventoryList);
    on<UpdateStock>(_updateStock);
  }

  FutureOr<void> _fetchInventoryList(
      FetchInventoryList event, Emitter<InventoryStates> emit) async {
    emit(FetchingInventoryList());
    try {
      String userId = await _customerCache.getUserId();
      String companyId = await _customerCache.getCompanyId();
      int branchId = await _customerCache.getBranchId();
      FetchProductListModel fetchProductListModel = await _productRepository
          .fetchProductList(userId, companyId, branchId);
      if (fetchProductListModel.status == 200) {
        emit(FetchedInventoryList(productList: fetchProductListModel.data));
      } else {
        emit(
            ErrorFetchingInventoryList(message: fetchProductListModel.message));
      }
    } catch (e) {
      emit(ErrorFetchingInventoryList(message: e.toString()));
    }
  }

  FutureOr<void> _updateStock(
      UpdateStock event, Emitter<InventoryStates> emit) async {
    emit(UpdatingStock());
    try {
      String userId = await _customerCache.getUserId();
      String companyId = await _customerCache.getCompanyId();
      int branchId = await _customerCache.getBranchId();

      SaveProductModel saveProductModel = await _productRepository.saveProduct(
          userId, companyId, branchId, event.productDetailsMap);

      if (saveProductModel.status == 200) {
        emit(UpdatedStock(message: saveProductModel.message));
      } else {
        emit(ErrorUpdatingStock(message: saveProductModel.message));
      }
    } catch (e) {
      emit(ErrorUpdatingStock(message: e.toString()));
    }
  }
}
