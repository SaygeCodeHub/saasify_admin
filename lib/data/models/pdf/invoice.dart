// import 'package:saasify/data/models/pdf/supplier.dart';
// import 'invoice_customer.dart';
//
// class Invoice {
//   // final InvoiceInfo info;
//   final Supplier supplier;
//   final InvoiceCustomerModel invoiceCustomer;
//   final List<InvoiceItem> items;
//
//   const Invoice({
//     // required this.info,
//     required this.supplier,
//     required this.invoiceCustomer,
//     required this.items,
//   });
// }
//
class InvoiceInfo {
  final String description;
  final String qty;
  final String mRP;
  final String rate;
  final String amount;

  const InvoiceInfo({
    required this.description,
    required this.qty,
    required this.mRP,
    required this.rate,
    required this.amount,
  });
}

class InvoiceBillDetails {
  final String subTotal;
  final String itemTotal;

  const InvoiceBillDetails({
    required this.subTotal,
    required this.itemTotal,
  });
}

// List<InvoiceInfo> invoiceInfo = [];
