import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/data/customer_cache/customer_cache.dart';

import '../../data/models/orders/fetch_orders_model.dart';
import '../../di/app_module.dart';
import '../../repositories/orders/orders_repository.dart';
import 'orders_event.dart';
import 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvents, OrdersStates> {
  final OrdersRepository _ordersRepository = getIt<OrdersRepository>();
  final CustomerCache _customerCache = getIt<CustomerCache>();

  OrdersStates get initialState => OrdersInitial();

  OrdersBloc() : super(OrdersInitial()) {
    on<FetchOrdersList>(_fetchOrdersList);
  }

  FutureOr<void> _fetchOrdersList(
      FetchOrdersList event, Emitter<OrdersStates> emit) async {
    emit(FetchingOrders());
    try {
      String userId = await _customerCache.getUserId();
      String companyId = await _customerCache.getCompanyId();
      int branchId = await _customerCache.getBranchId();

      FetchOrdersModel fetchOrdersModel =
          await _ordersRepository.fetchOrdersList(userId, companyId, branchId);
      if (fetchOrdersModel.status == 200) {
        emit(FetchedOrders(fetchOrdersModel: fetchOrdersModel));
      } else {
        emit(ErrorFetchingOrders(message: fetchOrdersModel.message));
      }
    } catch (e) {
      emit(ErrorFetchingOrders(message: e.toString()));
    }
  }
}
