import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/customer_cache/customer_cache.dart';
import '../../data/models/inventory/inventory_list_model.dart';
import '../../di/app_module.dart';
import '../../repositories/inventory/inventory_repository.dart';
import 'inventory_event.dart';
import 'inventory_states.dart';

class InventoryBloc extends Bloc<InventoryEvents, InventoryStates> {
  final CustomerCache _customerCache = getIt<CustomerCache>();
  final InventoryRepository _inventoryRepository = getIt<InventoryRepository>();

  InventoryStates get initialState => InventoryInitial();

  InventoryBloc() : super(InventoryInitial()) {
    on<FetchInventoryList>(_fetchInventoryList);
    on<EditInventoryStock>(_editStock);
  }

  FutureOr<void> _fetchInventoryList(
      FetchInventoryList event, Emitter<InventoryStates> emit) async {
    emit(FetchingInventoryProductList());
    // try {
    String userId = await _customerCache.getUserId();
    String companyId = await _customerCache.getCompanyId();
    int branchId = await _customerCache.getBranchId();
    InventoryListModel fetchInventoryProductList = await _inventoryRepository
        .fetchInventoryList(userId, companyId, branchId);
    if (fetchInventoryProductList.status == 200) {
      emit(FetchedInventoryProductList(
          inventoryProductList: fetchInventoryProductList.data));
    } else {
      emit(FetchInventoryProductListError(
          message: fetchInventoryProductList.message));
    }
    // } catch (e) {
    //   emit(FetchInventoryProductListError(message: e.toString()));
    // }
  }

  FutureOr<void> _editStock(
      EditInventoryStock event, Emitter<InventoryStates> emit) async {
    emit(EditingInventoryStock());
    // try {
    //   String userId = await _customerCache.getUserId();
    //   String companyId = await _customerCache.getCompanyId();
    //   int branchId = await _customerCache.getBranchId();
    //
    //   // SaveProductModel saveProductModel = await _productRepository.saveProduct(
    //   //     userId, companyId, branchId, event.productDetailsMap);
    //
    //   if (saveProductModel.status == 200) {
    //     emit(EditedInventoryStock(message: saveProductModel.message));
    //   } else {
    //     emit(ErrorEditingInventoryStock(message: saveProductModel.message));
    //   }
    // } catch (e) {
    //   emit(ErrorEditingInventoryStock(message: e.toString()));
    // }
  }
}
