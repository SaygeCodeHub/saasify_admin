class CalculateModel {
  double subTotal;
  double gst;
  double total;

  CalculateModel(
      {required this.subTotal, required this.gst, required this.total});
}

class PurchaseOrderModel {
  int quantity;
  double rate;
  double amount;

  PurchaseOrderModel({
    required this.amount,
    required this.quantity,
    required this.rate,
  });
}
