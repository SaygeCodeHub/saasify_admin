import 'package:hive_flutter/adapters.dart';
import 'package:saasify/data/models/billing/bill_model.dart';
import 'package:saasify/data/models/billing/selected_product_model.dart';

part 'customer_model.g.dart';

@HiveType(typeId: 5)
class Customer {
  @HiveField(0)
  String customerName;
  @HiveField(1)
  String customerContact;
  @HiveField(2)
  BillModel billDetails;
  @HiveField(3)
  List<SelectedProductModel> productList;

  Customer(
      {required this.customerName,
      required this.customerContact,
      required this.billDetails,
      required this.productList});

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
      customerName: json["customer_name"],
      customerContact: json["customer_contact"],
      billDetails: BillModel.fromJson(json["bill_details"]),
      productList: List<SelectedProductModel>.from(
          json["product_list"].map((e) => SelectedProductModel.fromJson(e))));

  Map<String, dynamic> toJson() => {
        "customer_name": customerName,
        "customer_contact": customerContact,
        "bill_details": billDetails.toJson(),
        "product_list": List.from(productList.map((e) => e.toJson()))
      };
}
