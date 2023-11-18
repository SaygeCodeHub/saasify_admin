import 'package:hive_flutter/adapters.dart';

part 'bill_model.g.dart';

@HiveType(typeId: 1)
class BillModel {
  @HiveField(0)
  double itemTotal;
  @HiveField(2)
  double discount;
  @HiveField(3)
  double total;

  BillModel(
      {required this.itemTotal, required this.total, required this.discount});
}
