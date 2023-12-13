import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/purchaseorder/purchase_order_event.dart';
import 'package:saasify/bloc/purchaseorder/purchase_order_state.dart';
import 'package:saasify/data/models/purchase_order/calculate_model.dart';

class PurchaseOrderBloc extends Bloc<PurchaseOrderEvent, PurchaseOrderState> {
  CalculateModel calculate = CalculateModel(
      subTotal: 0, gst: 0, total: 0, amount: 0, quantity: 0, rate: 0);

  PurchaseOrderBloc() : super(PurchaseOrderInitial()) {
    on<LoadPurchaseOrder>(_loadPurchaseOrder);
    on<CalculateTotal>(_calculateTotal);
  }

  FutureOr<void> _loadPurchaseOrder(
      LoadPurchaseOrder event, Emitter<PurchaseOrderState> emit) {
    emit(PurchaseOrderLoaded(calculateModel: calculate));
  }

  FutureOr<void> _calculateTotal(
      CalculateTotal event, Emitter<PurchaseOrderState> emit) {
    calculate.subTotal = 0;
    calculate.amount = 0;
    calculate.quantity = 0;
    calculate.rate = 0;

    calculate.subTotal = calculate.quantity * calculate.rate;
    calculate.gst = calculate.subTotal * (calculate.gst / 100);
    calculate.total = calculate.subTotal + calculate.gst;

    PurchaseOrderLoaded(calculateModel: calculate);
  }
//     calculate.gst = calculate.itemTotal *
//     (calculate.gst / 100);
//
// calculate.total = (calculate.subTotal+
//     calculate.gst);
}
