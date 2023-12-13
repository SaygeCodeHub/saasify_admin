import 'package:hive_flutter/adapters.dart';

@HiveType(typeId: 1)
class CalculateModel {
  @HiveField(0)
  double subTotal;
  @HiveField(2)
  double gst;
  @HiveField(3)
  double total;
  @HiveField(4)
  int quantity;
  @HiveField(5)
  double rate;
  @HiveField(6)
  double amount;

  CalculateModel(
      {required this.amount,
      required this.quantity,
      required this.rate,
      required this.subTotal,
      required this.gst,
      required this.total});
}
