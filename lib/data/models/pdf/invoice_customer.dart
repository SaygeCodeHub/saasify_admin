class InvoiceCustomerModel {
  String orderedDate;
  String orderNo;
  String customerContact;
  String customerName;
  String paymentType;
  String totalAmount;
  String paymentStatus;

  InvoiceCustomerModel({
    required this.orderedDate,
    required this.orderNo,
    required this.customerContact,
    required this.customerName,
    required this.paymentType,
    required this.totalAmount,
    required this.paymentStatus,
  });
}

List<InvoiceCustomerModel> invoiceCustomersList = [];
