import 'package:hive_flutter/adapters.dart';

part 'bill_model.g.dart';

@HiveType(typeId: 1)
class BillModel {
  @HiveField(0)
  double itemTotal;
  @HiveField(2)
  double discount;
  @HiveField(3)
  double discountPercent;
  @HiveField(4)
  double total;
  @HiveField(1)
  double gst;
  @HiveField(5)
  double gstPercent;

  BillModel(
      {required this.gst,
      required this.gstPercent,
      required this.discountPercent,
      required this.itemTotal,
      required this.total,
      required this.discount});

  factory BillModel.fromJson(Map<String, dynamic> json) => BillModel(
      gst: json["gst"],
      gstPercent: json["gst_percent"],
      discountPercent: json["discount_percent"],
      itemTotal: json["item_total"],
      total: json["total"],
      discount: json["discount"]);

  Map<String, dynamic> toJson() => {
        "gst": gst,
        "gst_percent": gstPercent,
        "discount_percent": discount,
        "item_total": itemTotal,
        "total": total,
        "discount": discount
      };
}
