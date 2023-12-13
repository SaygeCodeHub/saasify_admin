import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/purchaseorder/purchase_order_event.dart';
import 'package:saasify/bloc/purchaseorder/purchase_order_state.dart';
import 'package:saasify/data/models/purchase_order/calculate_model.dart';

class PurchaseOrderBloc extends Bloc<PurchaseOrderEvent, PurchaseOrderState> {
  CalculateModel calculate =
      CalculateModel(subTotal: 0, gst: 0, total: 0, gstPercent: 0);

  List<PurchaseOrderModel> purchaseOrderList = [
    PurchaseOrderModel(amount: 0, quantity: 0, rate: 0),
    PurchaseOrderModel(amount: 0, quantity: 0, rate: 0),
    PurchaseOrderModel(amount: 0, quantity: 0, rate: 0)
  ];

  PurchaseOrderBloc() : super(PurchaseOrderInitial()) {
    on<LoadPurchaseOrder>(_loadPurchaseOrder);
  }

  FutureOr<void> _loadPurchaseOrder(
      LoadPurchaseOrder event, Emitter<PurchaseOrderState> emit) {
    calculate.subTotal = 0;
    for (var item in purchaseOrderList) {
      calculate.subTotal += item.rate * item.quantity;
      calculate.gst = (calculate.subTotal * calculate.gstPercent) / 100;
      calculate.total = calculate.subTotal + calculate.gstPercent;
    }
    emit(PurchaseOrderLoaded(purchaseOrderList: purchaseOrderList));
  }
}
