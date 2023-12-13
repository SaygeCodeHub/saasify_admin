import 'package:saasify/data/models/purchase_order/calculate_model.dart';

abstract class PurchaseOrderState {}

class PurchaseOrderInitial extends PurchaseOrderState {}

class PurchaseOrderLoaded extends PurchaseOrderState {
  final List<PurchaseOrderModel> purchaseOrderList;

  PurchaseOrderLoaded({required this.purchaseOrderList});
}
