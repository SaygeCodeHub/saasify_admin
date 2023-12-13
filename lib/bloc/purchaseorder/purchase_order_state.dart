import 'package:saasify/data/models/purchase_order/calculate_model.dart';

abstract class PurchaseOrderState {}

class PurchaseOrderInitial extends PurchaseOrderState {}

class PurchaseOrderLoaded extends PurchaseOrderState {
  final CalculateModel calculateModel;

  PurchaseOrderLoaded({required this.calculateModel});
}
