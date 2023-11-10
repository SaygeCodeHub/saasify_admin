import 'package:hive_flutter/adapters.dart';

part 'bill_model.g.dart';

@HiveType(typeId: 1)
class BillModel {
  @HiveField(0)
  double itemTotal;
  @HiveField(1)
  double gSTCharges;
  @HiveField(2)
  double additionalCharges;
  @HiveField(3)
  double total;

  BillModel(
      {required this.itemTotal,
      required this.total,
      required this.additionalCharges,
      required this.gSTCharges});
}
