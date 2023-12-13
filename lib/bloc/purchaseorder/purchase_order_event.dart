import '../../data/models/purchase_order/calculate_model.dart';

abstract class PurchaseOrderEvent {}

class LoadPurchaseOrder extends PurchaseOrderEvent {}

class CalculateTotal extends PurchaseOrderEvent {}

class PurchaseOrderListData extends PurchaseOrderEvent {
  final PurchaseOrderModel purchaseOrderModel;
  PurchaseOrderListData({required this.purchaseOrderModel});
}

// class UpdateItemEvent extends PurchaseOrderEvent {
//   final int index;
//   final String itemName;
//   final int quantity;
//   final double rate;
//
//   UpdateItemEvent(this.index, this.itemName, this.quantity, this.rate);
// }
