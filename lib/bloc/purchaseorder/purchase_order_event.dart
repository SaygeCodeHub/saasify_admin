abstract class PurchaseOrderEvent {}

class LoadPurchaseOrder extends PurchaseOrderEvent {}

class CalculateTotal extends PurchaseOrderEvent {}

// class UpdateItemEvent extends PurchaseOrderEvent {
//   final int index;
//   final String itemName;
//   final int quantity;
//   final double rate;
//
//   UpdateItemEvent(this.index, this.itemName, this.quantity, this.rate);
// }
