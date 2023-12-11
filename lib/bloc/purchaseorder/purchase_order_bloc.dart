import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/purchaseorder/purchase_order_event.dart';
import 'package:saasify/bloc/purchaseorder/purchase_order_state.dart';

class PurchaseOrderBloc extends Bloc<PurchaseOrderEvent, PurchaseOrderState> {
  PurchaseOrderBloc() : super(PurchaseOrderInitial()) {
    on<LoadPurchaseOrder>(_loadPurchaseOrder);
  }
  FutureOr<void> _loadPurchaseOrder(
      LoadPurchaseOrder event, Emitter<PurchaseOrderState> emit) {
    emit(PurchaseOrderLoaded());
  }
}
