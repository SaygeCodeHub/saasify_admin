import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/product/product_state.dart';
import '../../di/app_module.dart';
import '../../repositories/inventory/inventory_repository.dart';
import 'inventory_event.dart';
import 'inventory_states.dart';

class InventoryBloc extends Bloc<InventoryEvents, InventoryStates> {
  final InventoryRepository _inventoryRepository = getIt<InventoryRepository>();

  ProductStates get initialState => ProductInitial();

  InventoryBloc() : super(InventoryInitial()) {
    on<FetchInventoryList>(_fetchInventoryList);
  }

  FutureOr<void> _fetchInventoryList(
      FetchInventoryList event, Emitter<InventoryStates> emit) async {
    emit(FetchingInventoryList());
  }
}
