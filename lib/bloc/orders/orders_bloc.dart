import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/orders/fetch_orders_model.dart';
import '../../di/app_module.dart';
import '../../repositories/orders/orders_repository.dart';
import 'orders_event.dart';
import 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvents, OrdersStates> {
  final OrdersRepository _ordersRepository = getIt<OrdersRepository>();

  OrdersStates get initialState => OrdersInitial();

  OrdersBloc() : super(OrdersInitial()) {
    on<FetchOrdersList>(_fetchOrdersList);
  }

  FutureOr<void> _fetchOrdersList(
      FetchOrdersList event, Emitter<OrdersStates> emit) async {
    emit(FetchingOrders());
    try {
      FetchOrdersModel fetchOrdersModel =
          await _ordersRepository.fetchOrdersList();
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
