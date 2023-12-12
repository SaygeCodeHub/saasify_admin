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

final List<InvoiceCustomerModel> invoiceCustomersList = [
  InvoiceCustomerModel(
    orderedDate: '12-12-23',
    orderNo: '1',
    customerContact: '1234333223',
    customerName: 'customer',
    paymentType: 'cash',
    totalAmount: '150',
    paymentStatus: 'paid',
  ),
  InvoiceCustomerModel(
    orderedDate: '12-12-23',
    orderNo: '1',
    customerContact: '1234333223',
    customerName: 'customer',
    paymentType: 'cash',
    totalAmount: '150',
    paymentStatus: 'paid',
  ),
  InvoiceCustomerModel(
    orderedDate: '12-12-23',
    orderNo: '1',
    customerContact: '1234333223',
    customerName: 'customer',
    paymentType: 'cash',
    totalAmount: '150',
    paymentStatus: 'paid',
  ),
  InvoiceCustomerModel(
    orderedDate: '12-12-23',
    orderNo: '1',
    customerContact: '1234333223',
    customerName: 'customer',
    paymentType: 'cash',
    totalAmount: '150',
    paymentStatus: 'paid',
  ),
];
